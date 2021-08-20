function [ x, y ] = d2xy ( m, d )

%*****************************************************************************80
%
%% D2XY converts a 1D Hilbert coordinate to a 2D Cartesian coordinate.
%
%  Discussion:
%
%    By connecting the cells labeled D = 0 through D = N * N - 1, a
%    path is constructed which connects all the cells in an N x N grid.
%
%  Modified:
%
%    05 October 2017
%
%  Parameters:
%
%    Input, integer M, the index of the Hilbert curve.
%    The number of cells is N=2^M.
%    0 < M.
%
%    Input, integer D, the Hilbert coordinate of the cell.
%    0 <= D < N * N.
%
%    Output, integer X, Y, the Cartesian coordinates of the cell.
%    0 <= X, Y < N.
%
  if ( m <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'D2XY - Fatal error!\n' );
    fprintf ( 1, '  0 < M required.\n' );
    fprintf ( 1, '  M = %d\n', m );
    error ( 'D2XY: Fatal error!' );
  end

  n = 2 ^ m;

  if ( d < 0 || n * n <= d )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'D2XY - Fatal error!\n' );
    fprintf ( 1, '  0 <= D < N * N required.\n' );
    fprintf ( 1, '  N * N = %d\n', n * n );
    fprintf ( 1, '  D = %d\n', d );
    error ( 'D2XY: Fatal error!' );
  end

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
    
    [ x, y ] = rot ( s, x, y, rx, ry );

    x = x + s * rx;
    y = y + s * ry;

    t = floor ( t / 4 );
    s = s * 2;

  end

  return
end
