% die Funktion kann die optimalen Auszahlungsmenge für die pareto-optimalen Sicherheitsstrategien der beiden Spieler:innen,
% die minimalen und maximalen Strategien für eine gegebene Schrittweite und Toleranzgrenze und die zugehörigen Auszahlungen berechnen und plotten
% für eine beispielhafte Eingabe siehe test.m
function findOptimalStrategies(struct)
g1 = struct.g1;
g2 = struct.g2;
[m,n] = size(g1);
epsilon = struct.eps;

% Auszahlungen, die durch POSS generiert werden, plotten
if struct.poss == 1
    % POSS1 brechnen und plotten
    [img_p1] = poss1(g1);
    figure(1);
    hold on;
    plot(img_p1);
    title('POSS');
    clear rep;

    % POSS2 berechnen und plotten
    [img_p2] = poss2(g1);
    opt.color2d = 0.5*[3/4 4/5 17/20];
    plot(img_p2,opt)
    legend('POSS1','','','POSS2','','')
    hold off;
    clear rep;
    clear opt;
end

% optimale Strategien für 2x2 oder 3x3 Matrizen berechnen und ggf plotten
aa = 0;
dd = struct.t;
if struct.min == 1 || struct.max == 1 % falls optimale Strategien geplottet werden soll
    figure(3);
    axis([0 1 0 1]);
    x = [0; 1; 0];
    y = [0; 0; 1];
    title('Optimale Strategien')
    text(0.75,0.9,'minimal','Color','red');
    text(0.75,0.8,'maximal','Color','blue');
    patch(x,y,[3/4 4/5 17/20],'FaceAlpha',.3);
    xlabel('p_1 und/ oder q_1');
    ylabel('p_2 und/ oder q_2');
elseif struct.minV == 1 || struct.maxV == 1
    figure(3);
    title('optimale Auszahlungen')
    opt1.color = [1 0 0];
    opt1.color2d = [1 0 0];
    opt1.color1d = [0 0 0];
    opt1.color0d = [0 0 0];
    opt1.vertexsize = 0.01;
    opt1.edgewidth = 1;
    opt1.alpha = 0.2;
    opt2.color = [0 0 1];
    opt2.color2d = [0 0 1];
    opt2.color1d = [0 0 0];
    opt2.color0d = [0 0 0];
    opt2.vertexsize = 0.01;
    opt2.edgewidth = 1;
    opt2.alpha = 0.2;
end
hold on;
while aa <= 1 % loop über alle möglichen Strategien
    if m == 3
        bb = 0;
    else
        bb = 1-aa;
    end
    while aa+bb <= 1
        if m == 3 % falls 3x3 Matrix
            cc = 1-aa-bb;
            while aa+bb+cc <= 1
                p = [aa;bb;cc];
                V1 = calculateV1(p,g1);
                V1 = eval(V1);
                B1 = hrep(V1).B;
                b1 = hrep(V1).b;
                ecken1 = vrep(V1).V;
                [p_min] = optimizetest(g1,B1,b1,ecken1,epsilon);
                if abs(p_min) <= epsilon
                    p % Ausgabe der minimalen Strategien
                    if struct.min == 1 % plotten der minimalen Strategien
                        plot(aa,bb,'o','Color','red','linewidth',2.5);
                    elseif struct.minV == 1 % plotten der zugehörigen Auszahlungen
                        plot(V1,opt1)
                    end
                end
                q = p;
                V2 = calculateV1(q,g2);
                V2 = eval(V2);
                B2 = hrep(V2).B;
                b2 = hrep(V2).b;
                ecken2 = vrep(V2).V;
                [q_max] = optimizetest(g2,B2,b2,ecken2,epsilon);
                if abs(q_max) <= epsilon
                    q % Ausgabe der maximalen Strategien
                    if struct.max == 1 % plotten der maximalen Strategien
                        plot(aa,bb,'+','Color','blue','linewidth',2)
                    elseif struct.maxV == 1 % plotten der zugehörigen Auszahlungen
                        plot(-1*V2,opt2)
                    end
                end
                cc = cc+dd;
            end
        else % falls keine 3x3 Matrix (Loop fast identisch zu 2x2 Fall) 
            p = [aa;bb];
            V1 = calculateV1(p,g1);
            V1 = eval(V1);
            B1 = hrep(V1).B;
            b1 = hrep(V1).b;
            ecken1 = vrep(V1).V;
            [p_min] = optimizetest(g1,B1,b1,ecken1);
            if abs(p_min) <= epsilon
                p % Ausgabe der minimalen Strategien
                if struct.min == 1
                    plot(aa,bb,'o','Color','red','linewidth',2.5);
                elseif struct.minV == 1 % plotten der zugehörigen Auszahlungen
                    plot(V1,opt1)
                end
            end
            q = p;
            V2 = calculateV1(q,g2);
            V2 = eval(V2);
            B2 = hrep(V2).B;
            b2 = hrep(V2).b;
            ecken2 = vrep(V2).V;
            [q_max] = optimizetest(g2,B2,b2,ecken2);
            if abs(q_max) <= epsilon
                q % Ausgabe der maximalen Strategien
                if struct.max == 1
                    plot(aa,bb,'+','Color','blue','linewidth',2)
                elseif struct.maxV == 1 % plotten der zugehörigen Auszahlungen
                    plot(-1*V2,opt2)
                end
            end
        end
        bb = bb+dd;
    end
    aa = aa+dd;
end
hold off;
end % function end
