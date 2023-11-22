% Module 6 Assignment - Loops
clc, clearvars, format compact, close all

% Raw Data (over 7 years, 1 company with 3 divisions)
division = ['a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c', 'a', 'b', 'c'];
revenue = [23, 44, -5, 16, 7, 9, 91, -1, -40, 44, 32, 35, 64, 71, 90, 17, 61, 27, 21, -9, 5];
        % revenue values in thousands

%%%%%%%%% PART ONE %%%%%%%%%
% Calculate total revenue using a single built-in function
TotalRev1 = sum(revenue);

% Calculate total revenue using a For Loop 
TotalRev2 = 0;
for i = 1:length(revenue)
   TotalRev2 = TotalRev2 + revenue(i); 
end

% Calculate total revenue using a While Loop
TotalRev3 = 0;
vals = length(revenue);
counter = 1;
while counter <= vals
    TotalRev3 = TotalRev3 + revenue(counter);
    counter = counter + 1;
end


%%%%%%%%% PART TWO %%%%%%%%%
% Calculate division a, b, and c's total revenue using a For Loop + If Statement
DivTotal1 = [0, 0, 0];
for i = 1:length(revenue)
    
   if division(i) == 'a'
       DivTotal1(1) = DivTotal1(1) + revenue(i);
   elseif division(i) == 'b'
       DivTotal1(2) = DivTotal1(2) + revenue(i);
   else   % division c
       DivTotal1(3) = DivTotal1(3) + revenue(i);
   end
   
end

% Calculate division a, b, and c's total revenue using a While Loop + Switch Statement
DivTotal2 = [0, 0, 0];
counter = 1;

while counter <= length(revenue)
    
    switch division(counter)
        case 'a'
        DivTotal2(1) = DivTotal2(1) + revenue(counter);
        case 'b'
        DivTotal2(2) = DivTotal2(2) + revenue(counter);
        otherwise    % c
        DivTotal2(3) = DivTotal2(3) + revenue(counter);
    end
   
    counter = counter + 1;
    
end

%%%%%%% PART THREE %%%%%%%
% Calculate division a's CUMULATIVE revenue
% Cumulative revenue is total revenue up to that point
% Example: the cumulative revenue for the third point is 23 + 44 - 5 = 65

% 'Filter' to just get the division a values in a separate matrix
logicA = (division == 'a');
divA = revenue.*logicA;

% Eliminate the zeros in divA to get a concise matrix
divA = nonzeros(divA)';

% Calculate the cumulative revenue for division a
CumuDivA = divA(1);
for i = 2:length(divA)
    % Cumulative = Previous + New Revenue
    CumuDivA(i) = CumuDivA(i-1) + divA(i);
end

% Make a Side-By-Side Barplot of the data!
bar_data = [divA' CumuDivA'];
bar(bar_data), legend('Revenue','Cumulative','Location','Northwest'), grid on
title('Revenue and Cumulative Revenue'), xlabel('Year'), ylabel('Thousands')

