function[v] = calculate_v_p_q(p,q,g)
  v = 0;
  for i = 1:size(p,1)
      for j = 1:size(q,1)
          v = v+p(i)*g{i,j}*q(j);
      end
  end
end