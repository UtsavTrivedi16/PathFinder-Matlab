% FindPathElevationsAndCost.m takes a specified path and finds the elevations encountered
% while walking along the path and also calculates the total cost of traversing that path.
% Inputs : 'r_i' is a 1D array containing row indices
%       : 'c_i' is a 1D array containing column indices.
%       : 'E' is a 2D array which contains elevation data
% Output : 'elev' is a 1D array containing the path to be traversed.
%        :'cost' denotes the sum of elevation changes.
% Author : 'Utsav Trivedi'

function [elev,cost]=FindPathElevationsAndCost(r_i,c_i,E)
    
    n = size(E,2);
    elev = zeros(1,n);

    for j = 1:length(E)
        elev(j) =  E(r_i(j),c_i(j));
        
    end
    cost = 0;

    for k = 1:length(elev)-1
        cost = (abs(elev(k+1)-elev(k)))+ cost;
        
    end

end



