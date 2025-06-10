% Controlabilidade e Observabilidade
clear; close all; clc();

% Modelo linear normalizado
A=[0 0 0 1 0 0 ; 0 0 0 0 1 0 ; 0 0 0 0 0 1 ; 0 -7.358 0.788 0 0.293 -0.143 ; 0 73.575 -33.11 0 -3.66 2.16 ; 0 -58.86 51.152 0 3.463 -2.443];
B=[0 0 ; 0 0 ; 0 0 ; 0.607 1.786 ; -1.5 -27 ; 0.286 30.54];
C=[1 0 0 0 0 0 ; 0 1 0 0 0 0 ; 0 0 1 0 0 0];
D=[0 0 ; 0 0 ; 0 0];
E=[0 ;0 ;0 ; 0.286; -12; 18.54];

%Funções de transferência
%Matrizes B e D reescritas para tirar todas FT
B_FT = [0 0 0; 0 0 0; 0 0 0; 0.607 1.786 0.286; -1.5 -27 -12; 0.286 30.54 18.54];
D_FT = [0 0 0; 0 0 0; 0 0 0];

%coeficientes das FT
[num1, den1] = ss2tf(A,B_FT,C,D_FT,1);
[num2, den2] = ss2tf(A,B_FT,C,D_FT,2);
[num3, den3] = ss2tf(A,B_FT,C,D_FT,3);

%Organizando
numg1 = num1(1,:);
numg2 = num1(2,:);
numg3 = num1(3,:);
numg4 = num2(1,:);
numg5 = num2(2,:);
numg6 = num2(3,:);
numg7 = num3(1,:);
numg8 = num3(2,:);
numg9 = num3(3,:);

G1 = tf(numg1,den1);
G2 = tf(numg2,den1);
G3 = tf(numg3,den1);
G4 = tf(numg4,den2);
G5 = tf(numg5,den2);
G6 = tf(numg6,den2);
G7 = tf(numg7,den3);
G8 = tf(numg8,den3);
G9 = tf(numg9,den3);

G = [G1 G2 G3; G4 G5 G6; G7 G8 G9];

%Polos
polos = eig(A)';

%Zeros e ganho em malha aberta
[z1, k1] = tf2zp(numg1, den1);
[z2, k2] = tf2zp(numg2, den1);
[z3, k3] = tf2zp(numg3, den1);
[z4, k4] = tf2zp(numg4, den2);
[z5, k5] = tf2zp(numg5, den2);
[z6, k6] = tf2zp(numg6, den2);
[z7, k7] = tf2zp(numg7, den3);
[z8, k8] = tf2zp(numg8, den3);
[z9, k9] = tf2zp(numg9, den3);