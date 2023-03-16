K = 5;
m = 3;
n = 3;
d = 1/20; % Schrittweite
eps = 10^-6;
time1 = 0;
y1 = 0;
x1 = 0;

for z = 1:5
% optimale Strategien bestimmen
g1 = cell(m,n);
for i = 1:m
    for j = 1:n
        g1{i,j} = randi([-10 10],K,1);
    end
end
g2 = cell(n,m);
for i = 1:m
    for j = 1:n
        g2{i,j} = -1*g1{j,i};
    end
end
a = 0;
x = 0;
y = 0;
tic;
while a<=1
    b = 0;
    while a+b<=1
        c = 1-b-a;
        while a+b+c<=1
            p = [a;b;c];
            V1 = calculateV1(p,g1);
            V1 = eval(V1);
            B1 = hrep(V1).B;
            b1 = hrep(V1).b;
            ecken1 = vrep(V1).V;
            [p_min] = optimizetest(g1,B1,b1,ecken1,eps);
            if abs(p_min) <= eps
                x = x+1;
            end
            V2 = calculateV1(p,g2);
            V2 = eval(V2);
            B2 = hrep(V2).B;
            b2 = hrep(V2).b;
            ecken2 = vrep(V2).V;
            [q_max] = optimizetest(g2,B2,b2,ecken2,eps);
            if abs(q_max) <= eps
                y = y+1;
            end
            c = c+d;
        end
        b = b+d;
    end
    a = a+d;
end
time = toc;
x1 = x1+x;
y1 = y1+y;
time1 = time1+time;
end
time1 = time1/5
x1 = x1/5
y1 = y1/5