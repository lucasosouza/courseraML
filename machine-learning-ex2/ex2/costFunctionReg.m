function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = size(X, 2);

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


%cost calculation
htheta = sigmoid(X * theta);
pos = -y .* log(htheta);
neg = (1 - y) .* log(1-htheta);
error = (pos - neg);
sumError = sum(error);
regularization = (lambda/(2*m))*sum(theta(2:n).^2);
cost = ((1/m) * sumError) + regularization;
J = cost;

%gradient calculation
errors = (htheta - y)' * X;
reg = (lambda/m)  * [0;theta(2:n)];
grad = ((1/m) * errors') + reg;


% =============================================================

end
