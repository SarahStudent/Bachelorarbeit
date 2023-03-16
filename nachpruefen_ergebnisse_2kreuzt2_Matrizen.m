% Hier sind nochmal 3 verschiedenen Beispiele gegeben, anhand derer der
% Optimalitätstest überprüft wurde
%g1 = {[1;0], [0;0]; [0;1], [1;0]};
%g2 = {[-1;0], [0;-1]; [0;0], [-1;0]};
%g1 = {[0;0], [4;4]; [3;1], [1;3]};
%g2 = {[0;0], [-3;-1]; [-4;-4], [-1;-3]};
g1 = {[0;0], [3;2]; [2;0], [1;2]};
g2 = {[0;0], [-2;0]; [-3;-2], [-1;-2]};


a = 0;
d = 1/100;
eps = 10^-6;
minp = 2;
maxp = -2;
minq = 2;
maxq = -2;
hold on;
while a <= 1
    b = 1-a;
    while a+b <= 1
        p = [a;b];
        V1 = calculateV1(p,g1);
        V1 = eval(V1);
        B1 = hrep(V1).B;
        b1 = hrep(V1).b;
        ecken1 = vrep(V1).V;
        [p_min] = optimizetest(g1,B1,b1,ecken1,eps);
        if abs(p_min) <= eps
            if minp > a
                minp = a;
            end
            if maxp < a
                maxp = a;
            end
        end
        V2 = calculateV1(p,g2);
        V2 = eval(V2);
        B2 = hrep(V2).B;
        b2 = hrep(V2).b;
        ecken2 = vrep(V2).V;
        [q_max] = optimizetest(g2,B2,b2,ecken2,eps);
        if abs(q_max)<= eps
            if minq > a
                minq = a;
            end
            if maxq < a
                maxq = a;
            end
        end
        b = b+d;
    end
    a = a+d;
end
hold off;
[minp maxp]
[minq maxq]