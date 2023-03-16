% Funktion testet anhand der übergebenen Parameter (B,b) von der Strategie p, ob diese für das Spiel g minimal ist
function [optval,sol_p,sol_d,status] = optimizetest(g,B,b,ecken,epsilon) % epsilon ist die Toleranzgrenze
  H = -1* B; % geht aus dem manual für bensolvetools hervor
  h = -1* b;
  r = size(ecken,2);
  [m,n] = size(g);
  % initialisierung der parameter
  repB = zeros(n*(size(H*g{1,1},1)+r)+1,m+r);
  repa = zeros(n*(size(H*g{1,1},1)+r)+1,1);
  repb = -log(0) * ones(n*(size(H*g{1,1},1)+r)+1,1);
  repl = zeros(1,m+r);
  d = zeros(1,m+r);

  % jetzt überall schrittweise werte auffüllen 
  for i = 1:r
    repl(m+i) = log(0);
    d(m+i) = 1;
  end

  k1 = 0; % werte der H darstellungen werden eingelesen
  for j = 1:n 
      for i = 1:m
          x = H*g{i,j};
          for k = 1:size(x,1)
              repB(k+k1,i) = x(k);
              repa(k+k1,1) = h(k);
          end
      end
      k1 = k1+size(x,1);
  end

  % ab hier werden die werte der hyperebenen-ungleichung eingesetzt
  k1 = n*size(H*g{1,1},1)+1;
  k2 = 1;
  for id = eye(r)
      [c,gamma] = hyperplane(ecken*id,B,b,epsilon);
      for j = 1:n
          for i = 1:m
              repB(k1,i) = c*g{i,j};
              repa(k1,1) = gamma;
          end
          repB(k1,m+k2) = -1;
          k1 = k1+1;
      end
      k2 = k2+1;
  end
  for i = 1:m % letzte Zeile
      repB(k1,i) = 1;
  end
  repa(k1,1) = 1;
  repb(k1,1) = 1;
  clear rep;
  rep.B = repB;
  rep.a = repa;
  rep.b = repb;
  rep.l = (repl)';
  rep.M = eye(m+r);
  S = polyh(rep);
  d = d';
  [optval,sol_p,sol_d,status] = lpsolve(d,S,'max'); % ist optval=0, ist die Strategie für den Spieler minimal
end
