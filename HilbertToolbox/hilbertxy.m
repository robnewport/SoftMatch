function h = hilbertxy(x)
    

p = 44;
n = 2;
max_h = 2 ^ (p * n) - 1;
max_x = 2 ^ p - 1;

M = bitsll(1, (p - 1));
Q = M;

    while Q > 1

        P = Q - 1;

        for i = 1:n
            if x(i) & Q
                x(1) = xor(x(1), P);
            else
                t = (xor(x(1), x(i))) & P;
                x(1) = xor(x(1), t);
                x(i) = xor(x(i), t);
            end

        Q = bitsra(Q, 1);

        end
    end

    % Gray encode
    for i = 2:n
        x(i) = xor(x(i), x(i-1))
    end

    t = 0;
    Q = M;

    while Q > 1
        if x(n-1) & Q
            t = xor(t,(Q - 1));
        end
        Q = bitsra(Q, 1);
    end
    
    for i = 1:n
        x(i) = xor(x(i), t);
    end
        
    % x_bit_str = [_binary_repr(x[i], self.p) for i in range(self.n)]
    % h = int(   ''.join(  [y[i] for i in range(self.p)    for y in x_bit_str]), 2)
    
    x_bit_str = dec2bin(x, p);    
    h = base2dec(s, 2)
    
end

    
    
    
    
    

    
    