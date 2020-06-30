% Greedy pick helps us to choose the next option in the path which has the minimum elevation
% giving preference to the northern most element in case of a tie.
% Inputs : 'C' is a 1D array containing the row and column indice for the
%         current position
%         'D' indicates whether to go East or West with the values 1 and -1
%         respectively.
%         'E' is the 2D matrix of 'm' rows and 'n' columns containing elevation
%         data
% Outputs : 'pick' is a 1D array containing the row and column indices of
% the new position
% Author : 'Utsav Trivedi'

function [pick] = GreedyPick(C,D,E)
    r = C(1);
    c = C(2);
    [m,n] = size(E); 
    C_E_V = E(r,c); 

    if D == 1
        
        if  c == n 
            disp('We cannot go further east')
            
            
        elseif r == 1  
            S = E(r:r+1,c+1);
            
        elseif r == m
            S = E(r-1:r,c+1);
        else   
            S = E(r-1:r+1,c+1);
        end
        
    elseif D == -1
        
        if  c == 1
            disp('We cannot go further west') 
            
            
        elseif r == 1 
            S = E(r:r+1,c-1);
        elseif  r == m  
            S = E(r-1:r,c-1);
        else
            S = E(r-1:r+1,c-1);
        end
    end

    if ~(D == 1 && c == n || D == -1 && c == 1)     
    
        [p] = FindSmallestElevationChange(C_E_V,S);
        
        V = p(1); 

        if  D == 1
            
            j = c+1;
        else
            j = c-1;
        end           
        
        if r == 1
            if V == 1   
                i = r;
            else
                i = r+1;
            end
        elseif V == 1
            i = r-1;      
        elseif V == 2
            i = r;
        else
            i = r+1;
        end
        
        pick = [i,j]; 
    end

end











