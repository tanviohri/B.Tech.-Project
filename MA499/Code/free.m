function x=free(T,lambda,h,r,theta,n,m,p,mu,c_free)
         x=floor((r + h/theta)*max(T*lambda-(n*p+m)*mu*T,0)/c_free);
end