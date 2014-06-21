%clear all; close all
lb = 0; ub = 20;
options = optimset ('Display','off ','TolFun',1e-5,'MaxFunEvals',2500);
X = linspace ( -5,5,500);
sigma = 1.4;
f = @(x,t) VGdensity(x,1,.4,sigma,0,t );
nT = 10;
t = linspace (0,1,nT );
pc = [.1 .25 .5 .75 .9 .95 .99];
for k = 1: nT
Y (:,k ) = VGdensity(X,1,.4,sigma,0,t(k) );
f = @(x) VGdensity(x,params(4),params(2),params(1),params(3),t(k));
VG_PDF = quadl (f,-3,30);
% for zz = 1:length( pc )
% percF = @(a) quadl (f,-3,a) - pc ( zz );
% PercA (k,zz ) = fzero( percF,1,options );
end
% end
% subplot(1,2,1)
plot(X,Y );
% legend('1 yr','2 yr','3 yr','4 yr',' 5 yr','6 yr','7 yr','8 yr','9yr','10 yr')
% xlim ([ -5 27]); ylim ([0 .32]); 
% subplot (1,2,2); 
% plot(t,PercA );
% for zz = 1:length( pc )
% text( t( zz ),PercA (zz,zz ),[{'\fontsize{9}\color{black}',num2str( pc ( zz ))}],'HorizontalAlignment',...
% 'center','BackgroundColor',[1 1 1]); hold on
% end
% xlim ([.5 10]); xlabel('years'); grid on