function c = bisectionMethod(f,a,b,error)
c=(a+b)/2;
while abs(f(c))>error
    if f(c)<0&&f(a)<0
        a=c;
    else
        b=c;
    end
    c=(a+b)/2;
end
end