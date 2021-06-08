%Mohammad Hasib
%QAC 154 Take Home Exam
%05/04/2021

%Problem 1 
%Creates a 5x3 matrix of random integers between 10 and 20 inclusive.
M = randi([10 20],5,3);

%Problem 2
%Puts each element of the 5x3 matrix into a row vector.
V = reshape(M,1,[]);

%Problem 3 
% Creates a variable IDX that returns a row vector of true/false values (using 1s and 0s)
% for the row vector V.
IDX = (V > 15);

%Problem 4
%Checks IDX and if the value is 1, meaning it was greater than 15, extracts
%the original value into a variable called y_values and additionally creates another vector that creates a
%corresponding vector with the number of elements in indlength. These
%can then be used to plot the relationships.
y_values = [];
i=1;
for plot1 = IDX
    if plot1 == 1
        y_values = [y_values V(i)];
    end
    i = i + 1;
end
indlength = 1 : length(y_values);


M2 = randi([10 20],5,3);
IDX2 = reshape(M2,1,[]);
y_values2 = [];
i = 1;
for plot2 = IDX2
    if plot2 > 15
        y_values2 = [y_values2 plot2]; 
    end
end
indlength2 = 1 : length(y_values2);

%Problem 4&5
%For a second random matrix M2, Checks IDX2 and if the value is 1, meaning it was greater than 15, extracts
%the original value into a variable called y_values2 and additionally creates another vector that creates a
%corresponding vector with the number of elements in indlength2. These
%can then be used to plot the relationships.
% We can then use the hold on command to plot both plot1 and plot2 together
% in one graph

maxx = max(max(indlength),max(indlength2));
minxx = min(min(indlength),min(indlength2));

figure;
plot(indlength, y_values, '-s')
xlabel('x'), ylabel('y')
hold on; plot(indlength2, y_values2, '-s'); hold off;
xlim([minxx-1, maxx+1]);
ylim([14, 21]);
legend('Plot1', 'Plot2')
