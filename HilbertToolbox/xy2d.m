function d = xy2d (m, x, y)

  d = 0;
  rx = 0;
  ry = 0;
  n = 2 ^ m;
  s = n / 2; 
  
  while s > 0 
      
      rx = bitand( uint32(x), uint32(s), 'uint32' ) > 0;
      ry = bitand( uint32(y), uint32(s), 'uint32' ) > 0;
      d = d + s * s * ( bitxor((3 * rx), ry, 'uint32'));

      if (ry == 0) 
        if (rx == 1) 
            x = n - 1 - x;
            y = n - 1 - y;
        end

        t = x;
        x = y;
        y = t;
        
      end
      
      s = s / 2;      
      
  end  
end
