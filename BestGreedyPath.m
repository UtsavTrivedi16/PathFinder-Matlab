% BestGreedyPath.m  will find the best greedy path by calculating greedy paths
% from every single element in the elevation array, iterating through the elements
% from the first row ,first column to the last.
% Inputs : 'E' is a 2D matrix containing elevation data.
% Outputs : 'pathRow' is a 1D array containing the row indices
%           'pathCol' is a 1D array containing the column indices
%           'pathElev' is a 1D array containing the elevation values
% Author : 'Utsav Trivedi'

function[pathRow,pathCol,pathElev] = BestGreedyPath(E)

    [m,n] = size(E);  

    for i = 1:m
    
        for j = 1:n
        

            C(1) = i;  
            C(2) = j;  
            
            if ~(j == 1) && ~(j == n) 
                D = -1;  
                
                S_c = zeros(1,n);   
                S_r = zeros(1,n);   
                S_e = zeros(1,n); 
                
                [P_r,P_c] = GreedyWalk(C,D,E);
                [N_c] = Reverse(P_c);
                [N_r] = Reverse(P_r);  
                S_c(1,1:j)=N_c(1,:);
                S_r(1,1:j)=N_r(1,:);
                
                D = 1; 
                
                [P_r,P_c] = GreedyWalk(C,D,E);
                b = size(P_r,2);             
                S_c(1,(j+1):n)=P_c(1,2:b);  
                S_r(1,(j+1):n) = P_r(1,2:b);
                [P_e,c] = FindPathElevationsAndCost(S_r,S_c,E);
                co(j) = c;                 
                S_e(1,:) = P_e(1,:);
                pCol(j,:) = S_c(1,:);        
                pRow(j,:) = S_r(1,:);
                pElev(j,:) = S_e(1,:);

            else
                
                F_c = zeros(1,n);
                F_r = zeros(1,n);  
                F_e = zeros(1,n);

                if j == n          
                    D = -1;
                else
                    D = 1;
                end

                [F_r,F_c] = GreedyWalk(C,D,E);
                [F_e,c] = FindPathElevationsAndCost(F_r,F_c,E);

                if j == n
                    
                    [F_c] = Reverse(F_c);
                    [F_r] = Reverse(F_r);  
                    [F_e] = Reverse(F_e);
                end
                co(j) = c;
                pCol(j,:) = F_c(1,:);
                pRow(j,:) = F_r(1,:);
                pElev(j,:) = F_e(1,:);
            end
        end
        
        p = strfind(co,min(co));
        
        f_co(i)=co(p(1));            
        F_Rows(i,:)=pRow(p(1),:);       
        F_Cols(i,:)=pCol(p(1),:);
        F_Elevs(i,:)=pElev(p(1),:);
        
        
    end

    f_p = strfind(f_co,min(f_co));  
    pathRow = F_Rows(f_p(1),:);    
    pathCol = F_Cols(f_p(1),:);
    pathElev = F_Elevs(f_p(1),:);

end






