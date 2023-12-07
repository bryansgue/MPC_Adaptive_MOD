%% Code to show the results of the Inverse kinematic controller

% Clean variables
% Clean variables
clc, clear all, close all;
 %%
% Load variables of the system
value = 1250;
value_MPC = 1250-30;
%% CARGA MIL
load("Adaptive_MPC.mat")

% Change variable size
%h = h(:, 1:end-1);
% h_p = h_p(:, 1:end-1);
% v = v(:, 1:end-1);
%vref = vref(:, 1:end-1);

% Time definition 
%t = t(1,1:end-1);
value = 29;
hd = hd(1:4,1:end-value);
h = h(1:4,1:end);

t_mpc = t(1,1:end-value);

Test = -Test;

%%
% Figure propert%% Figures
lw = 1.5; % linewidth 1
lwV = 2; % linewidth 2
fontsizeLabel = 11; %11
fontsizeLegend = 11;
fontsizeTicks = 11;
fontsizeTitel = 11;
sizeX = 1300; % size figure
sizeY = 900; % size figure

% color propreties
C1 = [246 170 141]/255; % (Rosa Claro)
C2 = [51 187 238]/255; % (Azul Cielo)
C3 = [0 153 136]/255; % (Verde Agua)
C4 = [238 119 51]/255; % (Naranja Vivo)
C5 = [204 51 17]/255; % (Rojo Terracota)
C6 = [238 51 119]/255; % (Rosa Intenso)
C7 = [187 187 187]/255; % (Gris Plateado)
C8 = [80 80 80]/255; % (Gris Oscuro)
C9 = [140 140 140]/255; % (Gris Medio)
C10 = [0 128 255]/255; % (Azul Brillante)
C11 = [234 52 89]/255; % (Rojo Frambuesa)
C12 = [39 124 252]/255; % (Azul Eléctrico)
C13 = [40 122 125]/255; % (Verde Petróleo)
C14 = [252 94 158]/255; % (Rosa Neón)
C15 = [244 171 39]/255; % (Amarillo Dorado)
C16 = [100 121 162]/255; % (Azul Grisáceo)
C17 = [255 0 0]/255; % (Rojo Puro)
C18 = [0 0 0]; % (Negro)
C19 = [81, 115, 180]/255;

%% New color slection

figure('Position', [500 500 sizeX sizeY])
set(gcf, 'Position', [500 500 sizeX sizeY]);
fig1_comps.fig = gcf;



%% GRAFICA 4
values_altura = 0.17;
valuea_ancho = 0.55;

axes('Position',[0.05 0.79 valuea_ancho values_altura]);  %axes('Position',[0.05 0.37 .35 .25]);

% Data generation

Tu_x = line(t_mpc(1,1:length(Tu(1,:))),Tu(1,:));
set(Tu_x, 'LineStyle', '-', 'Color', C5, 'LineWidth', 1.1*lw);

Test_x = line(t_mpc(1,1:length(Test(1,:))),Test(1,:));
set(Test_x, 'LineStyle', '-', 'Color', C3, 'LineWidth', 1.1*lw);


% Title of the image
hTitle_3 = title({'$\textrm{(c)}$'},'fontsize',14,'interpreter','latex','Color',C18);
%xlabel('$\textrm{Time}[s]$','fontsize',10,'interpreter','latex','Color',C18);
ylabel('$\textrm{Pose Error}[m]$','fontsize',10,'interpreter','latex', 'Color',C18);

% Legend nomeclature
hLegend_3 = legend([Tu_x, Test_x],{'$\tilde{\mathbf{\eta}}_{x_{Kinetic}}$','$\tilde{\mathbf{\eta}}_{x_{Dynamic}}$','$\tilde{\mathbf{\eta}}_{x_{MPC}}$'},'fontsize',12,'interpreter','latex','Color',[255 255 255]/255,'Location','best','NumColumns',1,'TextColor','black');
 set(gca,'ticklabelinterpreter','latex',...
         'fontsize',1.3*fontsizeTicks)
% Figure properties
ax_3 = gca;
ax_3.Box = 'on';
ax_3.BoxStyle = 'full';
ax_3.TickLength = [0.01;0.01];
ax_3.TickDirMode = 'auto';
% ax_3.XTickLabel = [];
ax_3.YMinorTick = 'on';
ax_3.XMinorTick = 'on';
ax_3.XMinorGrid = 'on';
ax_3.YMinorGrid = 'on';
%ax_1.MinorGridColor = '#8f8f8f';
ax_3.MinorGridAlpha = 0.15;
ax_3.LineWidth = 0.8;
ax_3.XLim = [0 t_mpc(end)];

%% GRAFICA 5

axes('Position',[0.05 0.54 valuea_ancho values_altura]);


Tu_y = line(t_mpc(1,1:length(Tu(2,:))),Tu(2,:));
set(Tu_y, 'LineStyle', '-', 'Color', C5, 'LineWidth', 1.1*lw);

Test_y = line(t_mpc(1,1:length(Test(2,:))),Test(2,:));
set(Test_y, 'LineStyle', '-', 'Color', C3, 'LineWidth', 1.1*lw)

% Title of the image
hTitle_3 = title({'$\textrm{(d)}$'},'fontsize',14,'interpreter','latex','Color',C18);
%xlabel('$\textrm{Time}[s]$','fontsize',10,'interpreter','latex','Color',C18);
ylabel('$\textrm{Pose Error}[m]$','fontsize',10,'interpreter','latex', 'Color',C18);

% Legend nomeclature
hLegend_3 = legend([Tu_y, Test_y],{'$\tilde{\mathbf{\eta}}_{y_{Kinetic}}$','$\tilde{\mathbf{\eta}}_{y_{Dynamic}}$','$\tilde{\mathbf{\eta}}_{y_{MPC}}$'},'fontsize',12,'interpreter','latex','Color',[255 255 255]/255,'Location','best','NumColumns',1,'TextColor','black');
 set(gca,'ticklabelinterpreter','latex',...
         'fontsize',1.3*fontsizeTicks)
% Figure properties
ax_3 = gca;
ax_3.Box = 'on';
ax_3.BoxStyle = 'full';
ax_3.TickLength = [0.01;0.01];
ax_3.TickDirMode = 'auto';
% ax_3.XTickLabel = [];
ax_3.YMinorTick = 'on';
ax_3.XMinorTick = 'on';
ax_3.XMinorGrid = 'on';
ax_3.YMinorGrid = 'on';
%ax_1.MinorGridColor = '#8f8f8f';
ax_3.MinorGridAlpha = 0.15;
ax_3.LineWidth = 0.8;
ax_3.XLim = [0 t_mpc(end)];


%% GRAFICA 6

axes('Position',[0.05 0.29 valuea_ancho values_altura]);
% 
Tu_z = line(t_mpc(1,1:length(Tu(3,:))),Tu(3,:));
set(Tu_z, 'LineStyle', '-', 'Color', C5, 'LineWidth', 1.1*lw);

Test_z = line(t_mpc(1,1:length(Test(3,:))),Test(3,:));
set(Test_z, 'LineStyle', '-', 'Color', C3, 'LineWidth', 1.1*lw)

% Title of the image
hTitle_3 = title({'$\textrm{(e)}$'},'fontsize',14,'interpreter','latex','Color',C18);
%xlabel('$\textrm{Time}[s]$','fontsize',10,'interpreter','latex','Color',C18);
ylabel('$\textrm{Pose Error}[m]$','fontsize',10,'interpreter','latex', 'Color',C18);

% Legend nomeclature
hLegend_3 = legend([Tu_z, Test_z],{'$\tilde{\mathbf{\eta}}_{z_{Kinetic}}$','$\tilde{\mathbf{\eta}}_{z_{Dynamic}}$','$\tilde{\mathbf{\eta}}_{z_{MPC}}$'},'fontsize',12,'interpreter','latex','Color',[255 255 255]/255,'Location','best','NumColumns',1,'TextColor','black');
 set(gca,'ticklabelinterpreter','latex',...
         'fontsize',1.3*fontsizeTicks)
% Figure properties
ax_3 = gca;
ax_3.Box = 'on';
ax_3.BoxStyle = 'full';
ax_3.TickLength = [0.01;0.01];
ax_3.TickDirMode = 'auto';
% ax_3.XTickLabel = [];
ax_3.YMinorTick = 'on';
ax_3.XMinorTick = 'on';
ax_3.XMinorGrid = 'on';
ax_3.YMinorGrid = 'on';
%ax_1.MinorGridColor = '#8f8f8f';
ax_3.MinorGridAlpha = 0.15;
ax_3.LineWidth = 0.8;
ax_3.XLim = [0 t_mpc(end)];

%% Ultima

%% GRAFICA 6

axes('Position',[0.05 0.05 valuea_ancho values_altura]);
% 
Tu_z = line(t_mpc(1,1:length(Tu(4,:))),Tu(4,:));
set(Tu_z, 'LineStyle', '-', 'Color', C5, 'LineWidth', 1.1*lw);

Test_z = line(t_mpc(1,1:length(Test(4,:))),Test(4,:));
set(Test_z, 'LineStyle', '-', 'Color', C3, 'LineWidth', 1.1*lw)

% Title of the image
hTitle_3 = title({'$\textrm{(e)}$'},'fontsize',14,'interpreter','latex','Color',C18);
%xlabel('$\textrm{Time}[s]$','fontsize',10,'interpreter','latex','Color',C18);
ylabel('$\textrm{Pose Error}[m]$','fontsize',10,'interpreter','latex', 'Color',C18);

% Legend nomeclature
hLegend_3 = legend([Tu_z, Test_z],{'$\tilde{\mathbf{\eta}}_{z_{Kinetic}}$','$\tilde{\mathbf{\eta}}_{z_{Dynamic}}$','$\tilde{\mathbf{\eta}}_{z_{MPC}}$'},'fontsize',12,'interpreter','latex','Color',[255 255 255]/255,'Location','best','NumColumns',1,'TextColor','black');
 set(gca,'ticklabelinterpreter','latex',...
         'fontsize',1.3*fontsizeTicks)
% Figure properties
ax_3 = gca;
ax_3.Box = 'on';
ax_3.BoxStyle = 'full';
ax_3.TickLength = [0.01;0.01];
ax_3.TickDirMode = 'auto';
% ax_3.XTickLabel = [];
ax_3.YMinorTick = 'on';
ax_3.XMinorTick = 'on';
ax_3.XMinorGrid = 'on';
ax_3.YMinorGrid = 'on';
%ax_1.MinorGridColor = '#8f8f8f';
ax_3.MinorGridAlpha = 0.15;
ax_3.LineWidth = 0.8;
ax_3.XLim = [0 t_mpc(end)];



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(gcf, 'Color', 'w'); % Sets axes background
export_fig E_Comp_ALL_MiL.pdf -q101

%% RMS dynamics


% save("Dynamic_real_rmse.mat","RMSE_x_dynamic", "RMSE_y_dynamic", "RMSE_z_dynamic", "error_dynamic");