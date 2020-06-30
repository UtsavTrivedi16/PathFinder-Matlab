% BestGreedyPathHeadingEast will find the best greedy path starting from the westerly edge
% (i.e. using starting points in column 1).
% In the event of one or more paths tying for the lowest cost, the path that starts with the lowest row number
% will be returned.
% Inputs : 'E' a 2D matrix containing elevation data
% Outputs : 'pathRow' a 1D array containing row indices for the path chosen
%        : 'pathCol' a 1D array containing column indices for the path chosen
%        : 'pathElev' a 1D array containing elevation values for the path chosen
% Author : 'Utsav Trivedi'

function[pathRow,pathCol,pathElev] = BestGreedyPathHeadingEast(E)

    [m,n] = size(E); 

    D = 1;
    for i = 1:m
        C(1) = i; 
        C(2) = 1; 
        [P_r,P_c] = GreedyWalk(C,D,E);
        S_c(i,:)=P_c(1,:); 
        S_r(i,:)=P_r(1,:); 
        [P_e,c] = FindPathElevationsAndCost(P_r,P_c,E);
        cost(i)=c; 
        S_e(i,:)=P_e(1,:);
    end

    p = strfind(cost,min(cost));
    pathRow=S_r(p(1),:);
    pathCol=S_c(p(1),:);        
    pathElev=S_e(p(1),:);     
                        
end

