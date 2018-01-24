% variaveis iniciais %
d0 = 1; %distancia inicial%
di = [1:1:16]; %distancia medida%
syms n; %% coeficiente %%
Pi_measured = load('corredor_caio_VV.txt'); % potencia medida%

Pid0 = Pi_measured(1); %perda inicial a distancia d0 % 
mPi = mean(Pi_measured');

%calculo Potencia estimada%
Pi_estimated= vpa(Pid0-(10*n*log10(di/d0))); %potencia estimada

%Calculo coeficiente e error %
error = (mPi(1:15)- Pi_estimated(1:15)).^2;
MMSE = diff(sum(error));
valor_n = solve(MMSE,n);
valor_n;
plot(Pi_measured, 'ob')


% Calculo da Perda %
% 
% % %calculo Potência estimada%
%  Pi_estimated_final = subs(Pi_estimated,n,valor_n);
%  
% % %%plot dos graficos%%d0
%  x = di;
%  y1 = Pi_measured;
%  y2 = Pi_estimated_final;
%  
%  figure
%  plot(x,y1,x,y2)
%  plot(Pi_measured, Pi_estimated)

