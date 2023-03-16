function [V2] = calculateV2(q,g)
  K = length(g{1,1});
  [m,n] = size(g);
  V = zeros([K m]);
  for i=1:m
      sum = 0;
      for j=1:n
          sum = sum + q(j) * g{i,j};
      end
      V(:,i) = sum;
  end
  rep2.V = V;
  V2 = polyh(rep2,'v');
  V2 = V2 + cone(K);
end