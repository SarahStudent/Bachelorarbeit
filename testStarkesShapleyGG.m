% diese Funktion testet anhand der H-Darstellungen der Polyeder V1(p) bzw V2(q) aus der BA, ob die Strategien p und q ein starkes Shapley-Gleichgewicht sind
function[ss] = testStarkesShapleyGG(g,B1,b1,B2,b2)
    ss = 0;
    K = length(g{1,1});
    c = zeros(K+K,1);
    l = zeros(K+K,1);
    clear rep;
    rep.M = eye(K+K);
    for i=1:K
      c(K+i)=1;
      l(i)=log(0);
    end
    rep.l = l;
    rep.a = -1* [b1; b2];
    rep.B = -1* [B1 zeros(size(B1));B2 -1*B2];
    S=polyh(rep);
    [optval,sol_p,sol_d,status] = lpsolve(c,S,'max');
    if optval == 0 % ist der Optimalwert des LPs =0, liegt ein starkes Shapley-Gleichgewicht vor
        ss = 1;
    end
end
