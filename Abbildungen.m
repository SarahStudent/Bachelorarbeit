% Hier werden ein großteil der Abbildungen aus der BA erzeugt
f1 = figure('Name','V1(p)'); % erste abbildung
p = [0.5;0.5];
q = [0;1];
g = {[0;0], [3;2]; [2;0], [1;2]};
V1 = calculateV1(p,g);
V1 = eval(V1);
V2 = calculateV2(q,g);
V2 = eval(V2);
hold on;
clear opt;
opt.color = [0.99 0.8 0.8];%rosa
opt.dirlength = 10;
plot(V1,opt);
clear opt;
opt.color = [0.6 0.8 1]; %hellblau
opt.dirlength = 10;
plot(V2,opt);
axis([0.5 2.5 0.5 3.5])
text(1,1.25,'$$ V_I (\bar{p}) $$','Interpreter','latex','FontSize', 20,'fontname','times');
text(1.5,2.75,'$$ V_{II} (\bar{q}) $$','Interpreter','latex','FontSize', 20,'fontname','times');
hold off;
print('V1_Abbildungen','-depsc')

% zweite Abbildung in der Arbeit:
f2 = figure('Name','Menge Minima');
hold on;
plot([0 2],[0 0],'-k');
plot([3 1],[2 2],'-k');
text(2.05,2.2,'$$ q=(0,1)^T $$','Interpreter','latex','fontname','times');
text(0.55,-0.2,'$$ q=(1,0)^T $$','Interpreter','latex','fontname','times');
text(-0.2,-0.2,'$$ p=(1,0)^T $$','Interpreter','latex','fontname','times','Color',[0.5 0.5 0.5]);
text(2.9,2.2,'$$ p=(1,0)^T $$','Interpreter','latex','fontname','times','Color',[0.5 0.5 0.5]);
plot(3,2,'ok','MarkerFaceColor',[0.8 0.8 0.8]);
plot(0,0,'ok','MarkerFaceColor',[0.8 0.8 0.8]);
plot(0,0,'ok');
plot(2,0,'ok');
plot(3,2,'ok');
plot(1,2,'ok');
plot([0 3],[0 2],'-r');
text(0.2,0.1,"\rightarrow","Color",[1 0 0]);
text(2.6,1.9,"\leftarrow","Color",[1 0 0]);
text(2.5,1.5,'$$ v_I (p) $$','Interpreter','latex','FontSize', 14,'fontname','times',"Color",[1 0 0]);
plot([1.5 1.5],[2 0],'--or');
text(1.2,2.2,'$$ p=(1/4,3/4)^T $$','Interpreter','latex','fontname','times',"Color",[1 0 0]);
text(1.2,-0.2,'$$ p=(1/4,3/4)^T $$','Interpreter','latex','fontname','times',"Color",[1 0 0]);
plot(1.5,2,'or','MarkerFaceColor',[1 0 0]);
plot(1.5,0,'or','MarkerFaceColor',[1 0 0]);
axis([-0.5 3.5 -0.5 2.5]);
hold off;
print('Minima_Veranschaulichung','-depsc')

% dritte Abbildung in der Arbeit:
f3 = figure('Name','Shapley');
p = [0;1];
q = [0.5;0.5];
V1 = calculateV1(p,g);
V1 = eval(V1);
V2 = calculateV2(q,g);
V2 = eval(V2);
hold on;
clear opt;
opt.dirlength = 10;
opt.color = [0.99 0.8 0.8];
plot(V1,opt);
opt.color = [0.6 0.8 1];
plot(V2,opt);
plot(1.5,1,'ob');
plot([1 2],[2 0],'-or');
text(0.25,2.2,'$$ v_I (\bar{p}) = Max~ v_I(\bar{p}) $$','Interpreter','latex','fontname','times',"Color",[1 0 0]);
text(1.8,0.8,'$$ v_{II}(\bar{q}) = Min~ v_{II}(\bar{q}) = v(\bar{p},\bar{q})$$','Interpreter','latex','fontname','times',"Color",[0 0 1]);
text(0,0.5,'$$ V_I (\bar{p}) $$','Interpreter','latex','FontSize', 20,'fontname','times',"Color",[1 0.7 0.7]);
text(2.5,2,'$$ V_{II} (\bar{q}) $$','Interpreter','latex','FontSize', 20,'fontname','times',"Color",[0.7 0.7 1]);
plot(1,2,'or','MarkerFaceColor',[1 0 0]);
plot(2,0,'or','MarkerFaceColor',[1 0 0]);
plot(1.5,1,'ob','MarkerFaceColor',[0 0 1]);
axis([-0.5 3.5 -0.5 2.5]);
hold off;
print('Beispiel_Shapley','-depsc')

f4 = figure('Name','kein Shapley');
p = [0.25;0.75]; % vierte abbildung
q = [0;1];
V1=calculateV1(p,g);
V1 = eval(V1);
V2 = calculateV2(q,g);
V2 = eval(V2);
hold on;
opt.color = [0.99 0.8 0.8];
plot(V1,opt);
opt.color = [0.6 0.8 1];
plot(V2,opt);
plot([3 1],[2 2],'-ob');
plot([1.5 1.5],[0 2],'-or');
text(2.5,2.2,'$$ v_{II}(\bar{\bar{q}}) $$','Interpreter','latex','fontname','times',"Color",[0 0 1]);
text(1.65,0.5,'$$ v_I (\bar{\bar{p}}) $$','Interpreter','latex','fontname','times',"Color",[1 0 0]);
text(0,0.5,'$$ V_I (\bar{\bar{p}}) $$','Interpreter','latex','FontSize', 20,'fontname','times',"Color",[1 0.7 0.7]);
text(2,3,'$$ V_{II} (\bar{\bar{q}}) $$','Interpreter','latex','FontSize', 20,'fontname','times',"Color",[0.7 0.7 1]);
plot(1.5,2,'or','MarkerFaceColor',[0 0 0]);
text(0.3,2.2,'$$ Min~ v_{II}(\bar{\bar{q}}) $$','Interpreter','latex','fontname','times',"Color",[0 0 0]);
plot(1,2,'ob','MarkerFaceColor',[0 0 0]);
text(1.65,1.8,'$$ Max~ v_I (\bar{\bar{p}}) = v(\bar{\bar{p}},\bar{\bar{q}}) $$','Interpreter','latex','fontname','times',"Color",[0 0 0]);
plot(1.5,0,'or','MarkerFaceColor',[1 0 0]);
plot(3,2,'ob','MarkerFaceColor',[0 0 1]);
axis([-0.5 3.5 -0.5 3.5]);
hold off;
print('Beispiel_keinShapley','-depsc')

% Ausgewählte Grenzen von V1 und V2
f5 = figure('Name','POSS');
g = {[5;0], [-1;-5], [4;-4]; [2;-2], [2;-7], [2;2]; [0;-6], [6;-2], [-2;4]};
clear opt;
opt.color = [1 1 1];
opt.color2d = [1 1 1];
opt.color1d = [0 0 0];
opt.color0d = [0 0 0];
opt.vertexsize = 0.01;
opt.edgewidth = 1;
opt.dirlength = 20;
opt.alpha = 0.2;
subplot(2,2,1)
hold on;
plot(calculateV1([0;1;0],g),opt)
plot(calculateV1([0.1;0.8;0.1],g),opt)
plot(calculateV1([0.2;0.6;0.2],g),opt)
plot(calculateV1([0.3;0.4;0.3],g),opt)
plot(calculateV1([0.4;0;0.6],g),opt)
plot(calculateV1([0.4;0.2;0.4],g),opt)
plot(calculateV1([0.5;0;0.5],g),opt)
plot(calculateV1([0.6;0;0.4],g),opt)
plot(calculateV1([0.7;0;0.3],g),opt)

% POSS 1
[img_p1] = poss1(g);
opt1.dirlength = 10;
opt1.color0d = 0.7*[3/4 4/5 17/20];
opt1.vertexsize = 0.01;
plot(img_p1, opt1)

% POSS 2
[img_p2] = poss2(g);
plot(img_p2,opt1)
axis([-2.5 5 -5 4.5])
text(3.5,2,'$$ \omega_I $$','Interpreter','latex','FontSize', 20,'fontname','times')
text(-2,-3.5,'$$ \omega_{II} $$','Interpreter','latex','FontSize', 20,'fontname','times')
hold off;

subplot(2,2,2)
hold on;
plot(calculateV2([0;0;1],g),opt)
plot(calculateV2([0;0.2;0.8],g),opt)
plot(calculateV2([0.2;0;0.8],g),opt)
plot(calculateV2([0.2;0.2;0.6],g),opt)
plot(calculateV2([0.4;0;0.6],g),opt)
plot(calculateV2([0.4;0.2;0.4],g),opt)
plot(img_p1,opt1)
plot(img_p2,opt1)
axis([-2.5 5 -5 4.5])
text(3.5,2,'$$ \omega_I $$','Interpreter','latex','FontSize', 20,'fontname','times')
text(-2,-3.5,'$$ \omega_{II} $$','Interpreter','latex','FontSize', 20,'fontname','times')
hold off;

subplot(2,2,3)
hold on;
plot(img_p1,opt1)
axis([-2.5 5 -5 4.5])
text(3.5,2,'$$ \omega_I $$','Interpreter','latex','FontSize', 20,'fontname','times')
x=[2;2;2.01;2.025;2.03;2.3;2.4;2.5;2.6;2.7;2.8;2.9;3;3.57143;3.57143;-3;-3];
y=[2;-0.8;-1;-1.2;-1.25;-1.45;-1.515;-1.56;-1.615;-1.65;-1.67;-1.69;-1.7;-1.71429;-6;-6;2];
patch(x,y,[3/4 4/5 17/20],'FaceAlpha',1)
text(-2,-3,'$$\cup_{p\in MIN (I)} V_{I}(p)$$','Interpreter','latex','FontSize', 15,'fontname','times')
hold off;

subplot(2,2,4)
hold on;
plot(img_p2,opt1)
text(-2,-3.5,'$$ \omega_{II} $$','Interpreter','latex','FontSize', 20,'fontname','times')
axis([-2.5 5 -5 4.5])
x=[-2;-2;-0.857143;1.16667;1.6;1.65;1.7;1.75;1.8;1.85;1.9;1.95;1.96;1.98;1.99;1.9955;2;2;2.01;2.02;2.04;2.04;2.085;2.085;5;5];
y=[6;4;-1.71429;-2.38889;-2.38889;-2.4;-2.41;-2.435;-2.475;-2.52;-2.59;-2.7;-2.73;-2.825;-2.885;-2.96;-3.05;-3.08333;-3.0833;-3.56;-3.56;-3.575;-3.575;-3.585;-3.585;6];
patch(x,y,[3/4 4/5 17/20],'FaceAlpha',1)
text(-1,1,'$$\cup_{q\in MAX (II)} V_{II}(q)$$','Interpreter','latex','FontSize', 15,'fontname','times')
hold off;
print('POSS_Abbildungen','-depsc')

% Animation Abbildungen
f = figure('Name','Animation');
p = [1;0];
g = {[0;0], [3;2]; [2;0], [1;2]};
V1 = calculateV1(p,g);
V1 = eval(V1);
clear opt;
opt.dirlength = 10;
plot(V1,opt)
text(0.5,0.5,'$$ V_I (p) $$','Interpreter','latex','FontSize', 20,'fontname','times');
axis([-0.5 3.5 -0.5 2.5])
print('Animation1','-depsc')
print('Animation1','-djpeg')

p = [7/8;1/8];
V1 = calculateV1(p,g);
V1 = eval(V1);
plot(V1,opt)
text(0.5,0.5,'$$ V_I (p) $$','Interpreter','latex','FontSize', 20,'fontname','times');
axis([-0.5 3.5 -0.5 2.5])
print('Animation2','-depsc')
print('Animation2','-djpeg')

p = [6/8;2/8];
V1 = calculateV1(p,g);
V1 = eval(V1);
plot(V1,opt)
text(0.5,0.5,'$$ V_I (p) $$','Interpreter','latex','FontSize', 20,'fontname','times');
axis([-0.5 3.5 -0.5 2.5])
print('Animation3','-depsc')
print('Animation3','-djpeg')

p = [5/8;3/8];
V1 = calculateV1(p,g);
V1 = eval(V1);
plot(V1,opt)
text(0.5,0.5,'$$ V_I (p) $$','Interpreter','latex','FontSize', 20,'fontname','times');
axis([-0.5 3.5 -0.5 2.5])
print('Animation4','-depsc')
print('Animation4','-djpeg')

p = [4/8;4/8];
V1 = calculateV1(p,g);
V1 = eval(V1);
plot(V1,opt)
text(0.5,0.5,'$$ V_I (p) $$','Interpreter','latex','FontSize', 20,'fontname','times');
axis([-0.5 3.5 -0.5 2.5])
print('Animation5','-depsc')
print('Animation5','-djpeg')

p = [3/8;5/8];
V1 = calculateV1(p,g);
V1 = eval(V1);
plot(V1,opt)
text(0.5,0.5,'$$ V_I (p) $$','Interpreter','latex','FontSize', 20,'fontname','times');
axis([-0.5 3.5 -0.5 2.5])
print('Animation6','-depsc')
print('Animation6','-djpeg')

p = [2/8;6/8];
V1 = calculateV1(p,g);
V1 = eval(V1);
plot(V1,opt)
text(0.5,0.5,'$$ V_I (p) $$','Interpreter','latex','FontSize', 20,'fontname','times');
axis([-0.5 3.5 -0.5 2.5])
print('Animation7','-depsc')
print('Animation7','-djpeg')

p = [1/8;7/8];
V1 = calculateV1(p,g);
V1 = eval(V1);
plot(V1,opt)
text(0.5,0.5,'$$ V_I (p) $$','Interpreter','latex','FontSize', 20,'fontname','times');
axis([-0.5 3.5 -0.5 2.5])
print('Animation8','-depsc')
print('Animation8','-djpeg')

p = [0/8;8/8];
V1 = calculateV1(p,g);
V1 = eval(V1);
plot(V1,opt)
text(0.5,0.5,'$$ V_I (p) $$','Interpreter','latex','FontSize', 20,'fontname','times');
axis([-0.5 3.5 -0.5 2.5])
print('Animation9','-depsc')
print('Animation9','-djpeg')