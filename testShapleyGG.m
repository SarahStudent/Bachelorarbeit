% diese Funktion berechnet anhand der H-Darstellungen der Polyeder V1(p) bzw. V2(q) aus der BA, ob zwei Strategien p und q für das Spiel g ein Shapley-Gleichgewicht bilden
function[s] = testShapleyGG(p,q,g,B1,b1,B2,b2)
  s = 0;
  v = calculate_v_p_q(p,q,g); % Funktion berechnet v(p,q)

  c1 = zeros(1,size(B1,2));
  f1 = B1 * v - b1;
  for i = 1:size(f1)
      if abs(f1(i)) <= 10^-6 % die Toleranzgrenze kann nach persönlichem Belieben natürlich angepasst werden
          c1 = c1 + B1(i,:);
      end
  end

  c2 = zeros(1,size(B2,2));
  f2 = B2 * v - b2;
  for i = 1:size(f2)
      if abs(f2(i)) <= 10^-6
          c2 = c2 + B2(i,:);
      end
  end
  if c1 > 0 % sind die Summen für Spieler 1 größer 0
      if c2 < 0 % und für Spielerin 2 kleiner 0
          s = 1; % dann liegt ein Shapley-Gleichgewicht vor
      end
  end
end
