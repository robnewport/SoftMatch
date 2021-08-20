function [ x, y ] = rot ( n, x, y, rx, ry ) 

%*****************************************************************************80
%
%% ROT rotates and flips a quadrant appropriately.
%
%  Modified:
%
%    05 December 2015
%
%  Parameters:
%
%    Input, integer N, the length of a side of the square.  
%    N must be a power of 2.
%
%    Input/output, integer X, Y, the coordinates of a point.
%
%    Input, integer RX, RY, ???
%
  if ( ry == 0 )
%
%  Reflect.
%
    if ( rx == 1 )
      x = n - 1 - x;
      y = n - 1 - y;
    end
%
%  Flip.
%
    t = x;
    x = y;
    y = t;

  end

  return
end
