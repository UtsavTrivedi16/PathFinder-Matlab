% Reverse.m reverses the array from left to right
% Inputs : 'x' is a 1D array
% Outputs : 'r' is the reversed array 'x'
% Author : 'Utsav Trivedi'

function[r] = Reverse(x)
    [m,n] = size(x); 

    if m == 1
        r = flip(x,2);
    elseif n == 1
        r = flip(x,1);
    end
    
end
