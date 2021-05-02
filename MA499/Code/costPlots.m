clear all;
clc;
p=0.8;
T_l = 2;
T_h = 1;
T = [T_l T_h];
lambda_l = 25;
lambda_h = 50;
lambda = [lambda_l lambda_h];
c_fix = 2/9;
c_flex = 1/3;
c_free = 0.35;
h = 1;
r = 1;
mu = 1;
theta = 0.5;
a = 1;
beta=(h/theta+r)*mu;

q=0.2:0.01:1;
cost_free=[];
cost_flex = [];
cost_fixed = [];
cost_blended = [];
for i=1:size(q,2)
    [m_tilde, n_tilde]=blended(a, q(i),T,lambda, c_fix, c_flex, h ,r, mu, theta);
    cost_blended = [cost_blended m_tilde*c_fix*(T_l+T_h) + n_tilde(2)*T_h*c_flex + n_tilde(1)*T_l*c_flex];
    cost_free = [cost_free m_tilde*c_fix*(T_l+T_h) + n_tilde(2)*T_h*c_flex + n_tilde(1)*T_l*c_flex + c_free*(T_l*free(T(1),lambda(1),h,r,theta,n_tilde(1),m_tilde,p,mu,c_free)+T_h*free(T(2),lambda(2),h,r,theta,n_tilde(2),m_tilde,p,mu,c_free))];
    cost_fixed = [cost_fixed (lambda(2))*c_fix*(T_l+T_h)];
    x1=flexible(q(i),lambda(1)/mu,a,c_flex,beta);
    x2=flexible(q(i),lambda(2)/mu,a,c_flex,beta);
    cost_flex = [cost_flex (x1*T_l+x2*T_h)*c_flex];
    
end
figure;
title('Total Staffing Costs');
hold on;
plot(q,cost_blended,'--');
plot(q,cost_fixed);
plot(q,cost_flex);
plot(q,cost_free,'.');
ylim([0 100]);
legend('blended', 'fixed only', 'flexible only', 'blended+freelancers');
hold off;