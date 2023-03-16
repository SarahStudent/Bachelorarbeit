% hier werden alle Abbildungen und Ergebnisse für das Spiel mit
% dreidimensionaler AUszahlung aus der BA erzeugt
f1 = figure('Name','V1');
p = [0;1];
g1 = {[0;0;0], [1;4;3]; [2;1;5], [1;1;1]};
g2 = {[0;0;0], [-2;-1;-5]; [-1;-4;-3], [-1;-1;-1]};
eps = 10^-6;
V1 = calculateV1(p,g1);
V1 = eval(V1);
hold on;
clear opt;
opt.color = [0.99 0.8 0.8]; % rosa
plot(V1,opt)
p = [0.25;0.75];
V1 = calculateV1(p,g1);
V1 = eval(V1);
opt.color = [0.9 0.8 0.85];
plot(V1,opt)
p = [0.5;0.5];
V1 = calculateV1(p,g1);
V1 = eval(V1);
opt.color = [0.8 0.8 0.9];
plot(V1,opt)
p = [0.75;0.25];
V1 = calculateV1(p,g1);
V1 = eval(V1);
opt.color = [0.7 0.8 0.95];
plot(V1,opt)
p = [1;0];
V1 = calculateV1(p,g1);
V1 = eval(V1);
opt.color = [0.6 0.8 1]; %hellblau
plot(V1,opt)
grid on
xlabel('x_1')
ylabel('x_2')
zlabel('x_3')
legend('p_1=0','','','p_1=0.25','','','p_1=0.5','','','p_1=0.75','','','p_1=1')
view(0,0)
%print('p_x1_x3','-djpeg') % speichert figure im jpg Format
print('p_x1_x3','-depsc')
view(90,0)
print('p_x2_x3','-depsc')
view(140,20)
print('p_x1_x2_x3','-depsc')
hold off

f2 = figure('Name','V2');
q = [0;1];
V2 = calculateV2(q,g1);
V2 = eval(V2);
hold on;
opt.color = [0.99 0.8 0.8];
plot(V2,opt)
q = [0.25;0.75];
V2 = calculateV2(q,g1);
V2 = eval(V2);
opt.color = [0.9 0.8 0.85];
plot(V2,opt)
q = [0.5;0.5];
V2 = calculateV2(q,g1);
V2 = eval(V2);
opt.color = [0.8 0.8 0.9];
plot(V2,opt)
q = [0.75;0.25];
V2 = calculateV2(q,g1);
V2 = eval(V2);
opt.color = [0.7 0.8 0.95];
plot(V2,opt)
q = [1;0];
V2 = calculateV2(q,g1);
V2 = eval(V2);
opt.color = [0.6 0.8 1];
plot(V2,opt)
grid on
xlabel('x_1')
ylabel('x_2')
zlabel('x_3')
legend('q_1=0','','','q_1=0.25','','','q_1=0.5','','','q_1=0.75','','','q_1=1')
view(0,0)
print('q_x1_x3','-depsc')
view(90,0)
print('q_x2_x3','-depsc')
view(-30,20)
print('q_x1_x2_x3','-depsc')
hold off

a = 0;
d = 1/200;
minp = 2;
maxp = -2;
minq = 2;
maxq = -2;
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
        if abs(p_min) <= 10^-6
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
        if abs(q_max) <= 10^-6
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
[minp maxp]
[minq maxq]

f3 = figure;
a = 1/10;
hold on;
clear opt;
V1 = calculateV1([0;1],g1);
V1 = eval(V1);
opt.color = [0.99 0.8 0.8];
opt.vertexsize = 0.001;
opt.edgewidth = 0.01;
opt.dirlength = 10;
plot(V1,opt)
legend('$$\cup_{p\in MIN (I)} V_{I}(p)$$','','','Interpreter','latex','Location','northwest','AutoUpdate','off')
while a <= 0.57
    b = 1-a;
    p = [a;b];
    V1 = calculateV1(p,g1);
    V1 = eval(V1);
    plot(V1,opt)
    a = a+1/10;
end
view(150,15)
axis([0 3 0 3 1 6])
xlabel('x_1')
ylabel('x_2')
zlabel('x_3')
grid on
print('Beispiel_dreidimensionaleAuszahlung_V1(p)','-depsc')
hold off;

f4 = figure;
subplot(2,2,1);
a = 1/10;
hold on;
opt.color = [0.6 0.8 1];
plot(calculateV2([0;1],g1),opt)
legend('$$\cup_{q\in MAX (II)} V_{II}(q)$$','','','Interpreter','latex','Location','southeast','AutoUpdate','off')
while a <= 0.745
    b = 1-a;
    p = [a;b];
    V1 = calculateV2(p,g1);
    V1 = eval(V1);
    plot(V1,opt)
    a = a+1/10;
end
plot(calculateV2([0.745;0.255],g1),opt)
grid on;
axis([0 3 0.5 1.5 0 5])
xlabel('x_1')
ylabel('x_2')
zlabel('x_3')
hold off;

subplot(2,2,2);
clear opt1;
hold on;
p = [0.75;0.25];
V1 = calculateV2(p,g1);
V1 = eval(V1);
opt1.dirlength = 10;
opt1.color0d = 0.7*[3/4 4/5 17/20];
opt1.vertexsize = 0.01;
plot(V1,opt1)
legend('$$V_{II}([0.75 ~ 0.25]^T)$$','','','Interpreter','latex','Location','southeast')
axis([0 3 0.5 1.5 0 5])
xlabel('x_1')
ylabel('x_2')
zlabel('x_3')
grid on;
hold off;

subplot(2,2,3);
a = 1/10;
hold on;
opt.color = [0.6 0.8 1];
plot(calculateV2([0;1],g1),opt)
while a <= 0.745
    b = 1-a;
    p = [a;b];
    V1 = calculateV2(p,g1);
    V1 = eval(V1);
    plot(V1,opt)
    a = a+1/10;
end
plot(calculateV2([0.745;0.255],g1),opt)
grid on;
axis([0 3 0.5 1.5 0 5])
xlabel('x_1')
ylabel('x_2')
zlabel('x_3')
view(-50,20)
hold off;

subplot(2,2,4);
clear opt1;
hold on;
p = [0.75;0.25];
V1 = calculateV2(p,g1);
V1 = eval(V1);
opt1.dirlength = 10;
opt1.color0d = 0.7*[3/4 4/5 17/20];
opt1.vertexsize = 0.01;
plot(V1,opt1)
axis([0 3 0.5 1.5 0 5])
xlabel('x_1')
ylabel('x_2')
zlabel('x_3')
grid on;
view(-50,20)
hold off;

print('Beispiel_dreidimensionaleAuszahlung_V2(q)','-depsc')