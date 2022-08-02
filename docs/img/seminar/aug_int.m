A = [0 1;0 0];
B=[0; 1];
C=[1 1];
plant=ss(A,B,C,[]);


K = [-1; 5];
G=[-2 -2];

A_cl=[A+B*G B*G;zeros(2,2) A-K*C];

B_cl=[B;0;0];
C_cl=[C 0 0];
sigma_y=0;

sys_cl=ss(A_cl,B_cl,C_cl,[]);
[y,t,x] = initial(sys_cl,[1 -1 -1 1].');

static_results=sim('augment_integrator.slx');

figure
subplot(2,1,1)
plot(static_results.y_static,'Color',[1/255 102/255 94/255])
hold on
grid on
plot(static_results.haty_static,'Color',[140/255 81/255 10/255])
legend('$y$','$\hat{y}$')

subplot(2,1,2)
plot(sim_results.uA)
legend('$u_A$')
grid on

%% Gen ACC talk plots

set(groot,'defaulttextinterpreter','tex');
set(groot, 'defaultAxesTickLabelInterpreter','tex');
set(groot, 'defaultLegendInterpreter','tex');
color1 = 1/255*[80,0,0];
color2 = 1/255*[0,60,113];


T=[static_results.haty_static.Time];

y_static=static_results.y_static.Data;
haty_static=static_results.haty_static.Data;

ey=y_static-haty_static;


% Set up first frame
figure('Color', 'white')
%%
p1=subplot(2,1,1)
plot(T, y_static, 'LineWidth', 2, 'Color',color1)
hold on
plot(T, haty_static, 'LineWidth', 2, 'Color',color2)
hh1(1) = line(T(1), y_static(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
hh1(2) = line(T(1), haty_static(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color2);
legend('$y$','$\hat{y}$','Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Output [arb.]', 'Interpreter','latex','fontsize',20)

p2=subplot(2,1,2)
plot(T, ey, 'LineWidth', 2, 'Color',color1)
hold on
hh2(1) = line(T(1), ey(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
legend('$e_y$', 'Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Estimator error [arb.]', 'Interpreter','latex','fontsize',20)
ht = title(sprintf('Time: %0.2f sec', T(1)));


%%
% Get figure size
%set(gcf,'units','points','position',[0,0,700,500])
pos = get(gcf, 'Position');
width = pos(3);
height = pos(4);

% Preallocate data (for storing frame data)
mov = zeros(height, width, 1, length(T), 'uint8');

% Loop through by changing XData and YData
for id = 1:1:length(T)
    
    % Update graphics data. This is more efficient than recreating plots.
    set(hh1(1), 'XData', T(id), 'YData', y_static(id, 1))
    set(hh1(2), 'XData', T(id), 'YData', haty_static(id, 1))
    set(hh2(1), 'XData', T(id), 'YData', ey(id, 1))

    
    set(ht, 'String', sprintf('Time: %0.2f sec', T(id)))
    
    % Get frame as an image
    f = getframe(gcf);
%     set(p2,'XLim',([T(id)-2 T(id)+2]))
%     set(p1,'XLim',([T(id)-2 T(id)+2]))
    
    set(p1,'YLim',([-1 1]))
    set(p2,'YLim',([-1 1]))

    %set(p3,'YLim',([-0.01 0.01]))
    % Create a colormap for the first frame. For the rest of the frames,
    % use the same colormap
    if id == 1
        [mov(:,:,1,id), map] = rgb2ind(f.cdata, 256, 'nodither');
        imwrite(mov(:,:,1,id),map,'c.gif','gif', 'DelayTime', 0,'LoopCount',inf)
    else
        mov(:,:,1,id) = rgb2ind(f.cdata, map, 'nodither');
        imwrite(mov(:,:,1,id),'c.gif','gif','WriteMode', 'append', 'DelayTime', 0)
    end
end
%% Bad A adapt
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


static_bad_results=sim('augment_integrator.slx',20);

figure
subplot(2,1,1)
plot(static_bad_results.y_static,'Color',[1/255 102/255 94/255])
hold on
grid on
plot(static_bad_results.haty_static,'Color',[140/255 81/255 10/255])
legend('$y$','$\hat{y}$')

%% Gen ACC talk plots

set(groot,'defaulttextinterpreter','tex');
set(groot, 'defaultAxesTickLabelInterpreter','tex');
set(groot, 'defaultLegendInterpreter','tex');
color1 = 1/255*[80,0,0];
color2 = 1/255*[0,60,113];


T=[static_bad_results.haty_static.Time];

y_static=static_bad_results.y_static.Data;
haty_static=static_bad_results.haty_static.Data;

ey=y_static-haty_static;


% Set up first frame
figure('Color', 'white')
%%
p1=subplot(2,1,1)
plot(T, y_static, 'LineWidth', 2, 'Color',color1)
hold on
plot(T, haty_static, 'LineWidth', 2, 'Color',color2)
hh1(1) = line(T(1), y_static(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
hh1(2) = line(T(1), haty_static(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color2);
legend('$y$','$\hat{y}$','Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Output [arb.]', 'Interpreter','latex','fontsize',20)

p2=subplot(2,1,2)
plot(T, ey, 'LineWidth', 2, 'Color',color1)
hold on
hh2(1) = line(T(1), ey(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
legend('$e_y$', 'Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Estimator error [arb.]', 'Interpreter','latex','fontsize',20)
ht = title(sprintf('Time: %0.2f sec', T(1)));


%%
% Get figure size
%set(gcf,'units','points','position',[0,0,700,500])
pos = get(gcf, 'Position');
width = pos(3);
height = pos(4);

% Preallocate data (for storing frame data)
mov = zeros(height, width, 1, length(T), 'uint8');

% Loop through by changing XData and YData
for id = 1:1:length(T)
    
    % Update graphics data. This is more efficient than recreating plots.
    set(hh1(1), 'XData', T(id), 'YData', y_static(id, 1))
    set(hh1(2), 'XData', T(id), 'YData', haty_static(id, 1))
    set(hh2(1), 'XData', T(id), 'YData', ey(id, 1))

    
    set(ht, 'String', sprintf('Time: %0.2f sec', T(id)))
    
    % Get frame as an image
    f = getframe(gcf);
%     set(p2,'XLim',([T(id)-2 T(id)+2]))
%     set(p1,'XLim',([T(id)-2 T(id)+2]))
%     
%     set(p1,'YLim',([-1000 1000]))
%     set(p2,'YLim',([-2 2]))

    %set(p3,'YLim',([-0.01 0.01]))
    % Create a colormap for the first frame. For the rest of the frames,
    % use the same colormap
    if id == 1
        [mov(:,:,1,id), map] = rgb2ind(f.cdata, 256, 'nodither');
        imwrite(mov(:,:,1,id),map,'c.gif','gif', 'DelayTime', 0,'LoopCount',inf)
    else
        mov(:,:,1,id) = rgb2ind(f.cdata, map, 'nodither');
        imwrite(mov(:,:,1,id),'c.gif','gif','WriteMode', 'append', 'DelayTime', 0)
    end
end

%% Bad A adapt
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
sigma_y=1

static_aug=sim('augment_integrator.slx',20);

figure
subplot(2,1,1)
plot(static_aug.y,'Color',[1/255 102/255 94/255])
hold on
grid on
plot(static_aug.yhat,'Color',[140/255 81/255 10/255])
legend('$y$','$\hat{y}$')

%% Gen ACC talk plots

set(groot,'defaulttextinterpreter','tex');
set(groot, 'defaultAxesTickLabelInterpreter','tex');
set(groot, 'defaultLegendInterpreter','tex');
color1 = 1/255*[80,0,0];
color2 = 1/255*[0,60,113];


T=[static_aug.yhat.Time];

y_static=squeeze(static_aug.y.Data);
haty_static=squeeze(static_aug.yhat.Data);

ey=y_static-haty_static;


% Set up first frame
figure('Color', 'white')
%%
p1=subplot(2,1,1)
plot(T, y_static, 'LineWidth', 2, 'Color',color1)
hold on
plot(T, haty_static, 'LineWidth', 2, 'Color',color2)
hh1(1) = line(T(1), y_static(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
hh1(2) = line(T(1), haty_static(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color2);
legend('$y$','$\hat{y}$','Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Output [arb.]', 'Interpreter','latex','fontsize',20)

p2=subplot(2,1,2)
plot(T, ey, 'LineWidth', 2, 'Color',color1)
hold on
hh2(1) = line(T(1), ey(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
legend('$e_y$', 'Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Estimator error [arb.]', 'Interpreter','latex','fontsize',20)
ht = title(sprintf('Time: %0.2f sec', T(1)));


%%
% Get figure size
%set(gcf,'units','points','position',[0,0,700,500])
pos = get(gcf, 'Position');
width = pos(3);
height = pos(4);

% Preallocate data (for storing frame data)
mov = zeros(height, width, 1, length(T), 'uint8');

% Loop through by changing XData and YData
for id = 1:1:length(T)
    
    % Update graphics data. This is more efficient than recreating plots.
    set(hh1(1), 'XData', T(id), 'YData', y_static(id, 1))
    set(hh1(2), 'XData', T(id), 'YData', haty_static(id, 1))
    set(hh2(1), 'XData', T(id), 'YData', ey(id, 1))

    
    set(ht, 'String', sprintf('Time: %0.2f sec', T(id)))
    
    % Get frame as an image
    f = getframe(gcf);
%     set(p2,'XLim',([T(id)-2 T(id)+2]))
%     set(p1,'XLim',([T(id)-2 T(id)+2]))
%     
%     set(p1,'YLim',([-6 6]))
%     set(p2,'YLim',([-2.5 2.5]))

    %set(p3,'YLim',([-0.01 0.01]))
    % Create a colormap for the first frame. For the rest of the frames,
    % use the same colormap
    if id == 1
        [mov(:,:,1,id), map] = rgb2ind(f.cdata, 256, 'nodither');
        imwrite(mov(:,:,1,id),map,'c.gif','gif', 'DelayTime', 0,'LoopCount',inf)
    else
        mov(:,:,1,id) = rgb2ind(f.cdata, map, 'nodither');
        imwrite(mov(:,:,1,id),'c.gif','gif','WriteMode', 'append', 'DelayTime', 0)
    end
end


%% Adaptive reg
A = [0 1;0 0];
B=[0; 1];
C=[1 1];
plant=ss(A,B,C,[]);

sigma_y=1

adapt_reg=sim('augment_integrator.slx',20);

figure
subplot(2,1,1)
plot(adapt_reg.y,'Color',[1/255 102/255 94/255])
hold on
grid on


%% Gen ACC talk plots

set(groot,'defaulttextinterpreter','tex');
set(groot, 'defaultAxesTickLabelInterpreter','tex');
set(groot, 'defaultLegendInterpreter','tex');
color1 = 1/255*[80,0,0];
color2 = 1/255*[0,60,113];


T=[adapt_reg.y.Time];

y_static=squeeze(adapt_reg.y.Data);

ey=squeeze(adapt_reg.G_adapt.Data);


% Set up first frame
figure('Color', 'white')
%%
p1=subplot(2,1,1)
plot(T, y_static, 'LineWidth', 2, 'Color',color1)
hold on
hh1(1) = line(T(1), y_static(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
legend('$y$','Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Output [arb.]', 'Interpreter','latex','fontsize',20)

p2=subplot(2,1,2)
plot(T, ey, 'LineWidth', 2, 'Color',color1)
hold on
hh2(1) = line(T(1), ey(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
legend('$e_y$', 'Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Adaptive gain [arb.]', 'Interpreter','latex','fontsize',20)
ht = title(sprintf('Time: %0.2f sec', T(1)));


%%
% Get figure size
%set(gcf,'units','points','position',[0,0,700,500])
pos = get(gcf, 'Position');
width = pos(3);
height = pos(4);

% Preallocate data (for storing frame data)
mov = zeros(height, width, 1, length(T), 'uint8');

% Loop through by changing XData and YData
for id = 1:1:length(T)
    
    % Update graphics data. This is more efficient than recreating plots.
    set(hh1(1), 'XData', T(id), 'YData', y_static(id, 1))
    set(hh2(1), 'XData', T(id), 'YData', ey(id, 1))

    
    set(ht, 'String', sprintf('Time: %0.2f sec', T(id)))
    
    % Get frame as an image
    f = getframe(gcf);
%     set(p2,'XLim',([T(id)-2 T(id)+2]))
%     set(p1,'XLim',([T(id)-2 T(id)+2]))
    
    set(p1,'YLim',([-2 2]))
    set(p2,'YLim',([-2.5 2.5]))

    %set(p3,'YLim',([-0.01 0.01]))
    % Create a colormap for the first frame. For the rest of the frames,
    % use the same colormap
    if id == 1
        [mov(:,:,1,id), map] = rgb2ind(f.cdata, 256, 'nodither');
        imwrite(mov(:,:,1,id),map,'c.gif','gif', 'DelayTime', 0,'LoopCount',inf)
    else
        mov(:,:,1,id) = rgb2ind(f.cdata, map, 'nodither');
        imwrite(mov(:,:,1,id),'c.gif','gif','WriteMode', 'append', 'DelayTime', 0)
    end
end

%% Adaptive reg
A = [0 1;0 3];
B=[0; 1];
C=[1 1];
plant=ss(A,B,C,[]);

sigma_y=1

adapt_reg=sim('augment_integrator.slx',20);

figure
subplot(2,1,1)
plot(adapt_reg.y,'Color',[1/255 102/255 94/255])
hold on
grid on


%% Gen ACC talk plots

set(groot,'defaulttextinterpreter','tex');
set(groot, 'defaultAxesTickLabelInterpreter','tex');
set(groot, 'defaultLegendInterpreter','tex');
color1 = 1/255*[80,0,0];
color2 = 1/255*[0,60,113];


T=[adapt_reg.y.Time];

y_static=squeeze(adapt_reg.y.Data);

ey=squeeze(adapt_reg.G_adapt.Data);


% Set up first frame
figure('Color', 'white')
%%
p1=subplot(2,1,1)
plot(T, y_static, 'LineWidth', 2, 'Color',color1)
hold on
hh1(1) = line(T(1), y_static(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
legend('$y$','Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Output [arb.]', 'Interpreter','latex','fontsize',20)

p2=subplot(2,1,2)
plot(T, ey, 'LineWidth', 2, 'Color',color1)
hold on
hh2(1) = line(T(1), ey(1,1), 'Marker', '.', 'MarkerSize', 20, ...
    'Color', color1);
legend('$e_y$', 'Interpreter','latex')
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Adaptive gain [arb.]', 'Interpreter','latex','fontsize',20)
ht = title(sprintf('Time: %0.2f sec', T(1)));


%%
% Get figure size
%set(gcf,'units','points','position',[0,0,700,500])
pos = get(gcf, 'Position');
width = pos(3);
height = pos(4);

% Preallocate data (for storing frame data)
mov = zeros(height, width, 1, length(T), 'uint8');

% Loop through by changing XData and YData
for id = 1:1:length(T)
    
    % Update graphics data. This is more efficient than recreating plots.
    set(hh1(1), 'XData', T(id), 'YData', y_static(id, 1))
    set(hh2(1), 'XData', T(id), 'YData', ey(id, 1))

    
    set(ht, 'String', sprintf('Time: %0.2f sec', T(id)))
    
    % Get frame as an image
    f = getframe(gcf);
%     set(p2,'XLim',([T(id)-2 T(id)+2]))
%     set(p1,'XLim',([T(id)-2 T(id)+2]))
    
    set(p1,'YLim',([-5 2]))
    set(p2,'YLim',([-9 2.5]))

    %set(p3,'YLim',([-0.01 0.01]))
    % Create a colormap for the first frame. For the rest of the frames,
    % use the same colormap
    if id == 1
        [mov(:,:,1,id), map] = rgb2ind(f.cdata, 256, 'nodither');
        imwrite(mov(:,:,1,id),map,'c.gif','gif', 'DelayTime', 0,'LoopCount',inf)
    else
        mov(:,:,1,id) = rgb2ind(f.cdata, map, 'nodither');
        imwrite(mov(:,:,1,id),'c.gif','gif','WriteMode', 'append', 'DelayTime', 0)
    end
end






