% Controlabilidade e Observabilidade
clear; close all; clc();

% Pêndulo duplo invertido com amortecimento nas juntas
% Modelo linear normalizado

A=[0 0 0 1 0 0 ; 0 0 0 0 1 0 ; 0 0 0 0 0 1 ; 0 -7.358 0.788 0 0.293 -0.143 ; 0 73.575 -33.11 0 -3.66 2.16 ; 0 -58.86 51.152 0 3.463 -2.443];
B=[0 0 ; 0 0 ; 0 0 ; 0.607 1.786 ; -1.5 -27 ; 0.286 30.54];
C=[1 0 0 0 0 0 ; 0 1 0 0 0 0 ; 0 0 1 0 0 0];
D=[0 0 ; 0 0 ; 0 0];
E=[0;0;0;0.286;-12;18.54];

% Sistema em Espaço de Estados
Sis_Malha_Aberta=ss(A,B,C,D);


%Matriz de controlabilidade
MatCtr = ctrb(A,B);

% Posto da matriz de controlabilidade
Control = rank(ctrb(A,B));

%Matriz de observabilidade
MatObs = obsv(A,C);

% Posto da matriz de observabilidade
Obs = rank(obsv(A,C));