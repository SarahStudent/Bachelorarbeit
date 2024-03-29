% Funktion berechnet für das Spiel g die optimale Menge an Auszahlungen, die durch die pareto-optimalen Sicherheitsstrategien von Spielerin 2 erzeugt werden
% die Berechnung der Menge stammmt aus dem Code zu dem Preprint https://arxiv.org/pdf/1701.08514.pdf, der mir im Rahmen der Bachelorarbeit zur Verfügung gestellt wurde
% hier liegt eine abgewandelte Version der Implementierung vor, die die bensolve tools verwendet
function[img_p2] = poss2(g)
    [m,n] = size(g);
    K = length(g{1,1});
    repB = [zeros(K*m,n+K); ones(1,n), zeros(1,K)];
    k1 = 0;
    for k = 1:K
        for i = 1:m 
            for j = 1:n
                repB(i+k1,j) = g{i,j}(k);
                repB(i+k1,n+k) = 1;
            end
        end
        k1 = k1+m;
    end
    repa = [zeros(K*m,1);1];
    repb = [Inf*ones(K*m,1);1];
    repl = [zeros(n,1);-Inf*ones(K,1)];
    P = [zeros(K,n),-eye(K)];
    C_poss = -cone(K);
    c_poss = -ones(K,1);
    rep.B = repB;
    rep.a = repa;
    rep.b = repb;
    rep.l = repl;
    rep.M = eye(m+K);
    S = polyh(rep);
    [img_p2] = vlpsolve(P,S,'min',C_poss,c_poss); % img_p2 stellt diese Menge dar
end
