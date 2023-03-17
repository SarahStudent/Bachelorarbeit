% Funktion berechnet für zwei Strategien p und q sowie die Spielmatrix g den Punkt v(p,q)
% die Formel zur Berechnung des Punktes v(p,q) stammt aus dem Preprint https://arxiv.org/pdf/1701.08514.pdf Seite 6
function[v] = calculate_v_p_q(p,q,g)
  v = 0;
  for i = 1:size(p,1)
      for j = 1:size(q,1)
          v = v+p(i)*g{i,j}*q(j);
      end
  end
end
