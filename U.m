function y=U(X,p,u)

indices=(abs(X)>=u);
y=sum(abs(X(indices)).^p);