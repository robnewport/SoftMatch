classdef HilbertCurve
    properties (Constant = true)
        m = 32; % dimension
    end
    methods(Static)
        
        function d = from2d(x, y)
            
            d = 0;
            rx = 0;
            ry = 0;
            n = 2 ^ HilbertCurve.m;
            s = n / 2; 
  
            while s > 0 

                rx = bitand( uint64(x), uint64(s), 'uint64' ) > 0;
                ry = bitand( uint64(y), uint64(s), 'uint64' ) > 0;
                d = d + s * s * ( bitxor((3 * rx), ry, 'uint64'));

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
        
        function [ x, y ] = from1d(d)

            n = 2 ^ HilbertCurve.m;
            x = 0;
            y = 0;
            t = d;
            s = 1;

            while ( s < n )

                rx = mod ( floor ( t / 2 ), 2 );

                if ( rx == 0 )
                    ry = mod ( t, 2 );
                else
                    ry = mod ( bitxor ( uint32 ( t ), uint32 ( rx ) ), 2 );
                end

                [ x, y ] = HilbertCurve.rot(s, x, y, rx, ry);

                x = x + s * rx;
                y = y + s * ry;
                t = floor ( t / 4 );
                s = s * 2;

            end
        end
        
        function [ x, y ] = rot( n, x, y, rx, ry ) 
            if ( ry == 0 )
                if ( rx == 1 )
                    x = n - 1 - x;
                    y = n - 1 - y;
                end
                t = x;
                x = y;
                y = t;
            end
            return
        end

    end
end

