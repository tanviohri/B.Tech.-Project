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
q=0.2:0.01:1;
for i=1:size(q,2)
    n_lambda(i)=flexible(q(i),lambda_l/mu,a,c_flex,beta);
end
plot(q,n_lambda);
