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
flex_l = [];
fixed_l = [];
blended_l = [];
flex_h = [];
fixed_h = [];
blended_h = [];
free_l=[];
free_h=[];
p=0.5;
c_free=0.35;
for i=1:size(q,2)
    [m_tilde, n_tilde]=blended(a, q(i),T,lambda, c_fix, c_flex, h ,r, mu, theta);
    for j=1:2
        n_tilde_show(j)=n_tilde(j)*p;
    end
    blended_l = [blended_l max(0,T(1)*lambda(1)-m_tilde-n_tilde_show(1))];
    blended_h = [blended_h max(0,T(2)*lambda(2)-m_tilde-n_tilde_show(2))];
    x1=flexible(q(i),lambda(1)/mu,a,c_flex,beta);
    x2=flexible(q(i),lambda(2)/mu,a,c_flex,beta);
    x1_show=x1*p;
    x2_show=x2*p;
    flex_l = [flex_l max(0,T(1)*lambda(1)-x1_show)];
    flex_h = [flex_h max(0,T(2)*lambda(2)-x2_show)];
    free_l=[free_l max(0,T(1)*lambda(1)-m_tilde-n_tilde(1)*p-free(T(1),lambda(1),h,r,theta,n_tilde(1),m_tilde,p,mu,c_free))];
    free_h=[free_h max(0,T(2)*lambda(2)-m_tilde-n_tilde(2)*p-free(T(2),lambda(2),h,r,theta,n_tilde(2),m_tilde,p,mu,c_free))];
end
figure;
sgtitle('Expected number of customers that abandon the system');
subplot(2,1, 1);
subtitle('Low-demand Period');
hold on;
plot(q,blended_l,'--');
plot(q,flex_l);
plot(q,free_l,'.');
legend('blended', 'flexible only','blended+freelancers');
ylim([-5,50]);
hold off;
subplot(2,1,2);
subtitle('High-demand Period');
hold on;
plot(q,blended_h,'--');
plot(q,flex_h);
plot(q,free_h,'.');
legend('blended', 'flexible only','blended+freelancers');
ylim([-5,50]);
hold off;
