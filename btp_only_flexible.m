clc;
clear all;
a=1;
h=1;
r=1;
theta=0.5;
lambda_h=50;
lambda_l=25;
mu=1;
c_flex=1/3;
epsilon_a=-1;
epsilon_b=1;
beta=(h/theta+r)*mu;
gamma=epsilon_a+(c_flex/beta)*(epsilon_b-epsilon_a);
q=0.2:0.01:1;
for i=1:size(q,2)
    n_lambda(i)=optimal_staffing(q(i),lambda_l,mu,a,gamma,c_flex,beta);
end
plot(q,n_lambda);
function x =optimal_staffing(q,lambda,mu,a,gamma,c_flex,beta)
         syms n;
%          if((0<=q) && (q<=1/2))
%              x=lambda/mu;
%          end
%          if((1/2<q) && (q<=3/4))
%              x=lambda/mu-a*((lambda/mu)^(q))*gamma;
%          end
%          if((q>3/4))
             f= @(n) c_flex-beta/2+(n^(-q))*(-(beta*lambda)/(2*mu)+(beta*q*lambda)/(2*mu))+(n^(1-q))*(beta/2-beta*q/4)+(n^(-q-1))*((-beta*q*(lambda^2))/(4*(mu^2)))+(n^(q-1))*(beta*q/4);
             x=bisectionMethod(f,lambda/mu,3*lambda/mu,1e-3);
         %end
end
