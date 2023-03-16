function[s] = testShapleyGG(p,q,g,B1,b1,B2,b2)
  s = 0;
  v = calculate_v_p_q(p,q,g);

  c1 = zeros(1,size(B1,2));
  f1 = B1 * v - b1;
  for i = 1:size(f1)
      if abs(f1(i)) <= 10^-6
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
  if c1 > 0
      if c2 < 0
          s = 1;
      end
  end
  c1
  c2
end