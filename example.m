T_l = 2;
T_h = 1;
T = [T_l T_h];
lambda_l = 25;
lambda_h = 50;
lambda = [lambda_l lambda_h];
c_fix = 2/9;
c_flex = 1/3;
h = 1;
r = 1;
mu = 1;
theta = 0.5;
a = 1;

blended(2,a, 1, T, lambda, c_fix, c_flex, h ,r, mu, theta);