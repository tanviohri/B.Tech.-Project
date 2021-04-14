clear all;
clc;

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
beta=(h/theta+r)*mu;

q=0.2:0.01:1;
m=[];
n_l=[];
n_h = [];
for i=1:size(q,2)
    [m_tilde, n_tilde]=blended(a, q(i),T,lambda, c_fix, c_flex, h ,r, mu, theta);
    m = [m m_tilde];
    n_h = [n_h n_tilde(2)];
    n_l = [n_l n_tilde(1)];
end
figure;
subplot(2,1, 1);
hold on;
plot(q,m);
plot(q,n_l);
legend('fixed', 'flexible');
ylim([0 100]);
hold off;
subplot(2,1,2);
hold on;
plot(q,m);
plot(q,n_h);
legend('fixed', 'flexible');
ylim([0 100]);
hold off;