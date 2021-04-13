function x =flexible(q,k,a,c_flex,beta)
         syms n;
         f= @(n) c_flex-beta*((k*n^(-q)/a-n^(1-q)+1/a)/2)-beta*a*q*(n^(q-1))*(((k*n^(-q)-n^(1-q))^2-1)/4);
         x=bisectionMethod(f,k,3*k,1e-5);
end