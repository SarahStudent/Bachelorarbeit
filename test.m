% diese Datei stellt ein Beispiel dar, wie findOptimalStrategies.m verwendet werden kann
% WICHTIGER HINWEIS: es können entweder die optimalen Strategien ODER die zugehören Auszahlungen geplottet werden, beides ist rein technisch nicht möglich
struct.g1 = {[5;0], [-1;-5], [4;-4]; [2;-2], [2;-7], [2;2]; [0;-6], [6;-2], [-2;4]}; % Matrix
struct.g2 = {[-5;0],[-2;2],  [0;6];  [1;5],  [-2;7], [-6;2];[-4;4], [-2;-2],[2;-4]}; % -1* Matrix^T

struct.poss = 1; % soll optimale Menge an POSS Auszahlungen geplottet werden

struct.min = 0; % sollen minimale Strategien geplottet werden
struct.max = 0; % sollen maximale Strategien geplottet werden

struct.minV = 0; % sollen auszahlungen der minimalen Strategien geplottet werden
struct.maxV = 1; % sollen auszahlungen der maximalen Strategien geplottet werden

struct.t = 1/20; % schrittweite
struct.eps = 10^-6; % toleranzgrenze

findOptimalStrategies(struct)
