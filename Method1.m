%% Computational Methods: Partial Differential Equations Coursework.
function [V,k,time] = Method1 (V,ROI,eps,maxI)

% Method A:
% V: NxM array with initial values set at boundary, everything else in the
% file is 0.
% ROI: Region of Interest, a text file with 1 inside of the region, 0 at
% the boundary and -1 outside of the boundary.
% eps: A small value. Stop iteration if difference between successive
% estimates is below this value.
% maxI: maximum number of iterations.

% Taking the dimensions of the ROI file.
[N,M] = size(ROI);

%Initialising the iterations counter variable
k = 0;

tic;
while (k < maxI)
    % Copy current estimate of solution array
    V_copy = V;
    for i = 2:N-1

        for j = 2:M-1
            %Update points inside boundary in the copied array.
            if (ROI(i,j)==1)
                % Jacobi itertaion method
                v = (V(i-1, j) + V(i,j-1) + V(i+1,j) + V(i, j+1)) / 4;
                V_copy(i,j) = v;
            end

        end
    end



    vdiff = abs(V_copy - V);

    % condition for the degree of tolerance (epsilon)
    if (vdiff < eps)
        break;
    end

    V = V_copy; %Over-write solution estimate
    k = k+1; %counter
end

%variable that measures the time taken to perform the iterations
time = toc;

end
