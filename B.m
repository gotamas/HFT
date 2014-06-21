function y=B(X,p,u)

indices=(abs(X)<=u);
y=sum(abs(X(indices)).^p);