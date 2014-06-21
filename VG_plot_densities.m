%clear all; close all

function Y=VG_plot_densities(params)
%params matrix:
%columns: sigma kappa b theta dt
X = linspace ( -0.01,0.01,500);
[rows,col]=size(params);
for k = 1: rows
Y (:,k ) = VGdensity(X,params(k,4),params(k,2),params(k,1),0,params(k,5));
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

end