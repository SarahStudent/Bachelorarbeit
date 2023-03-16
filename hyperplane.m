function [c,gamma] = hyperplane(e,B,b,epsilon)
  c = zeros(1,size(B,2));
  gamma = 0;
  f = B*e-b;
  for i = 1:size(f)
      if abs(f(i)) <= epsilon % z.B. 10^-6
          c = c + B(i,:);
          gamma = gamma + b(i);
      end
  end
  c = -1*c;
  gamma = -1*gamma;
end