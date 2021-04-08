function [m_tilde, n_tilde]=blended(a, q,T,lambda, c_fix, c_flex, h ,r, mu, theta)
    k = length(T);
    n_tilde = zeros(1, k);
    if q < 1
        if c_flex < c_fix
            k_0 = 0;
        else
            for j=1:k
                c_fix_j = c_fix*(sum(T))/(sum(T(j:end)));
                if c_flex >= c_fix_j
                    k_0 = j;
                end
            end
        end
        if k_0 > 0
            m_bar = lambda(k_0)/mu;
        else
            m_bar = 0;
        end
        m_tilde = m_bar;
        for  i=1:k_0
            n_tilde(i) = 0;
        end          
        for i=k_0+1:k
            n_tilde(i)= 0; %to be completed 
        end
    end
    if q == 1
        g = @(c) 0; %to be completed
        if c_flex < g(c_fix)
            k_1 = 0;
        else
            for j=1:k
                c_fix_j = c_fix*(sum(T))/(sum(T(j:end)));
                if c_flex >= g(c_fix_j)
                    k_1 = j;
                end
            end
        end
        m_tilde = lambda(k1)/mu;
        for  i=1:k_1
            n_tilde(i) = 0;
        end          
        for i=k_1+1:k
            n_tilde(i)= 0; %to be completed 
        end
    end
end