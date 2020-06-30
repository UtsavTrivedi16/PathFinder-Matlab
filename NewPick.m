% Newpick.m helps us to choose the next option in the path which has the
% minimum elevation.This is a helper function to help me solve BestPath.
% Inputs : 'C' is a 1D array containing the row and column indice for the
%         current position
%         'D' indicates whether to go East or West with the values 1 and -1
%         respectively.
%         'E' is the 2D matrix of 'm' rows and 'n' columns containing elevation
%         data
% Outputs : 'pick' is a 1D array containing the row and column indices of
% the new position
% Author : 'Utsav Trivedi'

function [prow,pcol] = NewPick(C,D,E)

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
        
        F = p(1);
        if length(p) > 1
            F = p(1);
            S = p(2);
            if length(p) == 3
                T = p(3);
            end
        end
        
            if  D == 1
                
                j = c+1;
            else
                j = c-1;
            end          
            
            if r == 1
                if F == 1   
                    i = r;
                    if length(p) > 1
                        i(2) = r+1;
                    end               
                else
                    i = r+1;
                end
            elseif F == 1
                i = r-1;
                if length(p) > 1
                    i(2) = r;
                end   
                if length(p) == 3
                    i(3) = r+1;
                end
            else
                i = r+1;
            end
            if length(p) > 1
                if D == 1
                    j(2) = c+1;
                else
                    j(2) = c-1;
                end
                if length(p) == 3
                    if D == 1
                        j(3) = c+1;
                    else
                        j(3) = c-1;
                    end
                end
            end
        end
    prow = i;
    pcol = j;
end







