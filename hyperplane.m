% Funktion berechnet die Stützhyperebene einer Ecke e eines Polyeders in H-Darstellung (B,b) mit den gewünschten Eigenschaften aus der BA
function [c,gamma] = hyperplane(e,B,b,epsilon)
  c = zeros(1,size(B,2));
  gamma = 0;
  f = B*e-b;
  for i = 1:size(f)
      if abs(f(i)) <= epsilon % Toleranzgrenze z.B. 10^-6
          c = c + B(i,:);
          gamma = gamma + b(i);
      end
  end
  c = -1*c;
  gamma = -1*gamma;
end
