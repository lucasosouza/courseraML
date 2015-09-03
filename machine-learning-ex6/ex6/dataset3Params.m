function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

kc = 0.01;
ksigma = 0.01;
min_error = 1000;
x1 = [1 2 1]; x2 = [0 4 -1];
while kc<1
	while ksigma<1
		%train
		model= svmTrain(X, y, kc, @(x1, x2) gaussianKernel(x1, x2, ksigma));
		%get predictions
		predictions = svmPredict(model, Xval);
		%calculate errors
		errors = mean(double(predictions ~= yval));
		%checks against min
		if errors < min_error
			min_error = errors
			C = kc
			sigma = ksigma
		end
		ksigma*=3;
	end
	kc *= 3;
	ksigma=0.01;
end








% =========================================================================

end
