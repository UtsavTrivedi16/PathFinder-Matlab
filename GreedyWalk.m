% GreedyWalk finds a greedy path from a specified start 
% position heading in a specified direction (either heading west or east) 
% and continue walking until the eastern or western edge of the array is
% reached. At each step along the path the next element in the path is picked using a greedy choice 
% (i.e. we choose the adjacent element that results in the minimum elevation change, 
% with the northern-most element chosen in an event of a tie).
% Inputs : 'C' is a 1D array containing the row and column indice for the
%         current position
%         'D' indicates whether to go East or West with the values 1 and -1
%         respectively.
%         'E' is the 2D matrix of 'm' rows and 'n' columns containing elevation
%         data
% Outputs : 'pathRows' is a 1D array containing the row indices of
% the new positions
%           'pathCols' is a 1D array containing the column indicex of the
%           new positions.
% Author : 'Utsav Trivedi'

function[pathRows,pathCols] = GreedyWalk(C,D,E)

    r = C(1);
    c = C(2);
    n = size(E,2); 

    if D == 1
        
        if c == n 
            disp(' We cannot go east as this is the end but can go west')
        else
            
            pathRows = r;
            pathCols = c;
            for k = 1:(n-c)    
                
                [p] = GreedyPick(C,D,E);
                pathRows(k+1) = p(1);
                pathCols(k+1) = p(2);
                C(1) = p(1);  
                C(2) = p(2);   
                
            end
        end
    elseif D == -1
        if c == 1 
            disp('We cannot go west as this is the end but can go east')
        else
        pathRows = r;
        pathCols = c;
        for k = 1:(c-1) 
            [p] = GreedyPick(C,D,E);
            pathRows(k+1) = p(1);
            pathCols(k+1) = p(2);
            C(1) = p(1);
            C(2) = p(2);
        end
        end
    end
end

    
    
    
    
    