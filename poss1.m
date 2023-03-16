% Funktion berechnet optimale Menge an Auszahlungen, die durch die pareto-optimalen Sicherheitsstrategien von Spieler 1 erzeugt werden
function[img_p1] = poss1(g)
    [m,n] = size(g);
    K = length(g{1,1}); % erstellen zulässigen Bereich des MOLP
    repB = [zeros(K*n,m+K);ones(1,m), zeros(1,K)];
    k1 = 0;
    for k = 1:K
        for j = 1:n 
            for i = 1:m
                repB(j+k1,i) = -1* g{i,j}(k);
                repB(j+k1,m+k) = 1;
            end
        end
        k1 = k1+n;
    end
    repa = [zeros(K*n,1);1];
    repb = [Inf*ones(K*n,1);1];
    repl = [zeros(m,1);-Inf*ones(K,1)];
    P = [zeros(K,m),eye(K)];
    rep.B = repB;
    rep.a = repa;
    rep.b = repb;
    rep.l = repl;
    rep.M = eye(m+K);
    S = polyh(rep);
    [img_p1] = molpsolve(P,S,'min'); % img_p1 stellt die optimale Menge dar
end
