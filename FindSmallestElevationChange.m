% FindSmallestElevationChange.m finds the position in an array of elevations of an element or elements that relate to the
% smallest change in elevation, given the current elevation.
% Inputs : 'E' which is the current elevation
%        : 'A' which is the 1D Array of elevations to choose from.
% Output : 'p' which denotes the position of the smallest elevation change
% in the array 'A'
% Author : 'Utsav Trivedi'

function [p] = FindSmallestElevationChange(E,A)

    n = size(A,2);     
    diff = zeros(1,n);

    for i = 1:length(A)
        
        diff(i) = (abs(E-A(i)));
        
    end

    p = strfind(diff,min(diff));
    
end










