function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)
%LEARNINGCURVE Generates the train and cross validation set errors needed 
%to plot a learning curve
%   [error_train, error_val] = ...
%       LEARNINGCURVE(X, y, Xval, yval, lambda) returns the train and
%       cross validation set errors for a learning curve. In particular, 
%       it returns two vectors of the same length - error_train and 
%       error_val. Then, error_train(i) contains the training error for
%       i examples (and similarly for error_val(i)).
%
%   In this function, you will compute the train and test errors for
%   dataset sizes from 1 up to m. In practice, when working with larger
%   datasets, you might want to do this in larger intervals.
%

% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return training errors in 
%               error_train and the cross validation errors in error_val. 
%               i.e., error_train(i) and 
%               error_val(i) should give you the errors
%               obtained after training on i examples.
%
% Note: You should evaluate the training error on the first i training
%       examples (i.e., X(1:i, :) and y(1:i)).
%
%       For the cross-validation error, you should instead evaluate on
%       the _entire_ cross validation set (Xval and yval).
%
% Note: If you are using your cost function (linearRegCostFunction)
%       to compute the training and cross validation error, you should 
%       call the function with the lambda argument set to 0. 
%       Do note that you will still need to use lambda when running
%       the training to obtain the theta parameters.
%
% Hint: You can loop over the examples with the following:
%
%       for i = 1:m
%           % Compute train/cross validation errors using training examples 
%           % X(1:i, :) and y(1:i), storing the result in 
%           % error_train(i) and error_val(i)
%           ....
%           
%       end
%

% ---------------------- Sample Solution ----------------------

mval = size(Xval, 1);
iters = 50;

for i=1:m

	err_train = 0;
	err_val = 0;

	for j=1:iters

		%select a random subset of training data
		rnd_train = randi(m, i, 1);
		X_train = X(rnd_train,:);
		y_train = y(rnd_train);

		%Select a random subset of cv data
		rnd_val = randi(mval, i, 1);
		X_val = Xval(rnd_val,:);
		y_val = yval(rnd_val);

		%train and get theta
		[theta] = trainLinearReg(X_train, y_train, lambda);

		%get the error for training sample
		sqe_train = sum(((X_train * theta) - y_train).^2);
		err_train += sqe_train/(2*i);

		%get the error for cv sample
		sqe_val = sum(((X_val * theta) - y_val).^2);
		err_val += sqe_val/(2*i);
	end

	error_train(i) = err_train/iters;
	error_val(i) = err_val/iters;

end


% -------------------------------------------------------------

% =========================================================================

end
