function [V1] = calculateV1(p,g)  
  K = length(g{1,1});
  [m,n] = size(g);
  V = zeros([K n]);
  for j = 1:n
      sum = 0;
      for i = 1:m
          sum = sum + p(i) * g{i,j};
      end
      V(:,j) = sum;
  end
  rep1.V = V;
  V1 = polyh(rep1,'v');
  V1 = V1 - cone(K);
end