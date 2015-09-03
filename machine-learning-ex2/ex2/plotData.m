function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%


% my attempt
% ful = [X y];
% idx = ful(:,3)==1;
% truthy = ful(idx,:);
% idx = ful(:,3)==0;
% falsy = ful(idx,:);
% plot(truthy(:,1),truthy(:,2), 'k+', 'color', 'r');
% plot(falsy(:,1),falsy(:,2), 'ko', 'color', 'b');

pos = find(y==1); neg=find(y==0)
plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 4, ...
     'MarkerSize', 3);
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', ...
     'MarkerSize', 3);

% =========================================================================



hold off;

end
