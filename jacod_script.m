%%
clc
clear
load('/home/tamas/2014/01 January/EUR_HUF_Week1_interp_60.mat')
plot(interpRates)
title('EURHUF árfolyam, \Delta_t=60s')
%%
y=price2ret(interpRates);
%max(y);
%min(y);
nu=100;
u=linspace(0,max(abs(y))/2,100);
np=100;
pmax=4;
pmin=1
p=linspace(pmin,pmax,np);

%%
Bmat=zeros(np,nu);
Umat=zeros(np,nu);
for i=1:np
    for j=1:nu
        Bmat(i,j)=B(y,p(i),u(j));
        Umat(i,j)=U(y,p(i),u(j));
    end
end

%% 
plot(Bmat(:,end)')
%% A levágási paraméter függvényében
plot(Bmat(1,:)')
hold on
plot(Umat(1,:)')
%%

surf(Bmat)
xlabel('p');
ylabel('u');
title('B(p,u,60sec) értéke az EURHUF árfolyamra')
%%
surf(Umat)
xlabel('p');
ylabel('u');
title('U(p,u,60sec) értéke az EURHUF árfolyamra')
%%
BperU=Bmat./Umat;
surf(BperU)
xlabel('p');
ylabel('u');











%% Interpolalas
clc; clear;
delta_n=3600:-60:60;
N=length(delta_n);
data=cell(N,1);
filename='/home/tamas/2014/01 January/EUR_HUF_Week1';
for i=1:N
    out=price2ret(ratedate_sec_interp(filename,delta_n(i)));
    data(i,1)=(mat2cell(out));
end

%%
alpha=0.0001;
omega=0.10;
maxi=max(abs(cell2mat(data(1,1))))
u_n=alpha*delta_n.^omega;
max(u_n)


%%
p=2;
Bn2=zeros(1,N);
Un2=zeros(1,N);
for i=1:N
    Bn2(i)=B(cell2mat(data(i,1)),p,u_n(i));
    Un2(i)=U(cell2mat(data(i,1)),p,u_n(i));
end

%%
p=1;
Bn1=zeros(1,N);
Un1=zeros(1,N);
for i=1:N
    Bn1(i)=B(cell2mat(data(i,1)),p,u_n(i));
    Un1(i)=U(cell2mat(data(i,1)),p,u_n(i));
end

%%
p=0;
Bn0=zeros(1,N);
Un0=zeros(1,N);
for i=1:N
    Bn0(i)=B(cell2mat(data(i,1)),p,u_n(i));
    Un0(i)=U(cell2mat(data(i,1)),p,u_n(i));
end
subplot(2,2,1)
plot(Bn1)
title('B(1,u_n,\Delta_n)')
xlabel('n')
ylabel('B')

subplot(2,2,2)
plot(Un1)
title('U(1,u_n,\Delta_n)')
xlabel('n')
ylabel('U')

subplot(2,2,3)
plot(Bn2)
title('B(2,u_n,\Delta_n)')
xlabel('n')
ylabel('B')

subplot(2,2,4)
plot(Un2)
title('U(2,u_n,\Delta_n)')
xlabel('n')
ylabel('U')


% % S_J
% S_J=[];
% p=2.4;
% ks=[1, 2, 3, 5, 6, 12, 20 , 30]
% for i=1:length(ks)
%     S_J(i)=B(cell2mat(data(ks(i),1)),p,1000);
% end
% S_J=S_J./B(cell2mat(data(1,1)),p,1000)
% plot(ks,[S_J' ks.^(0.5*p-1)'])
% title('Ugrasok tesztelése')
% legend('S_J(p,k,\Delta_n)','k^{(p/2-1)}')
% 

%% Wiener

S_W=[];
p=2;
k=3;
for i=1:15
    S_W(i)=B(cell2mat(data(3*i,1)),p,u_n(i))/B(cell2mat(data(i,1)),p,u_n(i));
end
subplot(2,1,1)
plot(S_W)
hold on
plot(k^(1-0.5*p)*ones(1,15))
hold off
title('Wiener tesztelése')
legend('S_W(p,k,\Delta_n)','k^{(1-p/2)}')
xlabel('n')
ylabel('S_W')


%% S_J 2
subplot(2,1,2)
S_J=[];
p=5;
k=3;
for i=1:15
    S_J(i)=B(cell2mat(data(3*i,1)),p,1000)/B(cell2mat(data(i,1)),p,1000);
end
plot(S_J)
hold on
plot(k^(0.5*p-1)*ones(1,15))
hold off
title('Ugrasok tesztelése')
legend('S_J(p,k,\Delta_n)','k^{(p/2-1)}')
xlabel('n')
ylabel('S_J')