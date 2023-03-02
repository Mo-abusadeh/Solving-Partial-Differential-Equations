%% Main Driver file for Computational Methods Coursework 3

% V: NxM array with initial values set at boundary, everything else in the
% file is 0.
% ROI: Region of Interest, a text file with 1 inside of the region, 0 at
% the boundary and -1 outside of the boundary.
% eps: A small value. Stop iteration if difference between successive
% estimates is below this value.
% maxI: maximum number of iterations.

% Loading the files:
V1 = load("bdry_Values_1.txt");
V2 = load("bdry_Values_2.txt");
V3 = load("bdry_Values_3.txt");
ROI1 = load("ROI_1.txt");
ROI2 = load("ROI_2.txt");
ROI3 = load("ROI_3.txt");

%Choice for ROI:
sel_ROI = -1;
disp("Options for ROI boundaries to solve for:");
disp("1)Square,     2) Circle,      3) Diamond");

% User chooses shape
while(sel_ROI~=1 && sel_ROI~=2 && sel_ROI~=3)
    sel_ROI = input('Please select ROI region: 1, 2, or 3');
end

eps = input('Please indicate the value for epsilon (tolerance for convergence)');
maxI = input('Please indication the value for the maximum number of iterations that you would like the program to be limited by');

switch sel_ROI

    case 1 % Square
        [Vout1,k1, time1] = Method1(V1,ROI1, eps, maxI);
        [Vout2, k2, time2]= Method2(V1,ROI1, eps, maxI);

    case 2 %Circle
        [Vout1,k1, time1] = Method1(V2,ROI2, eps, maxI);
        [Vout2, k2, time2]= Method2(V2,ROI2, eps, maxI);


    case 3 %Diamond
        [Vout1,k1, time1] = Method1(V3,ROI3, eps, maxI);
        [Vout2, k2, time2]= Method2(V3,ROI3, eps, maxI);

end

%Illustration of solution using method 1 and method 2
figure;

subplot(1,2,1)
imagesc(Vout1);
title("Method 1, number of iterations:" + num2str(k1) + "  time taken:" + num2str(time1))

subplot(1,2,2)
imagesc(Vout2);
title("Method 2, number of iterations:" + num2str(k2) + "  time taken:" + num2str(time2))
