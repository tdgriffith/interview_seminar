A = [0 1;0 0];
B=[0; 1];
C=[1 1];
plant=ss(A,B,C,[]);


K = [-1; 5];
G=[-2 -2];

A_cl=[A+B*G B*G;zeros(2,2) A-K*C];

B_cl=[B;0;0];
C_cl=[C 0 0];

sys_cl=ss(A_cl,B_cl,C_cl,[]);
[y,t,x] = initial(sys_cl,[1 -1 -1 1].');

sim_results=sim('augment_integrator.slx');

figure
subplot(2,1,1)
plot(sim_results.y,'Color',[1/255 102/255 94/255])
hold on
grid on
plot(sim_results.yhat,'Color',[140/255 81/255 10/255])
legend('$y$','$\hat{y}$')

subplot(2,1,2)
plot(sim_results.uA)
legend('$u_A$')
grid on
%% Bad A
set(groot,'defaulttextinterpreter','latex');
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

warning('off')

A = [0 1;0 3];
B=[0; 1];
C=[1 1];
plant=ss(A,B,C,[]);


K = [-1; 5];
G=[-2 -2];

A_cl=[A+B*G B*G;zeros(2,2) A-K*C];

B_cl=[B;0;0];
C_cl=[C 0 0];

sys_cl=ss(A_cl,B_cl,C_cl,[]);
[y,t,x] = initial(sys_cl,[1 -1 -1 1].');

sim_results=sim('augment_integrator.slx');

figure
subplot(2,1,1)
plot(sim_results.y,'Color',[1/255 102/255 94/255])
hold on
grid on
plot(sim_results.yhat,'Color',[140/255 81/255 10/255])
legend('$y$','$\hat{y}$')

subplot(2,1,2)
plot(sim_results.uA)
legend('$u_A$')
grid on
% 
% ,[140/255 81/255 10/255])
% hold on
% plot(sim_MRAC_ytilde.yp_true,'Color',[1/255 102/255 94/255])





