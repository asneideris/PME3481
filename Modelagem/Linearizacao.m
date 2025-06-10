clear; close all; clc();
%Definição dos símbolos
syms x1 x2 x3 x4 x5 x6 x4p x5p x6p F T I

%Equações de Lagrange dos subsistemas após substituição dos valores numéricos
eq1 = F == 2.75*x4p - 0.5*x5^2*sin(x2) + 0.5*x5p*cos(x2) - 0.28125*x6^2*sin(x3) + 0.28125*x6p*cos(x3);
eq2 = -T == 0.5*x4p*cos(x2) + 0.18*x5 + 0.229166666666667*x5p + 0.140625*x6^2*sin(x2 - x3) - 0.08*x6 + 0.140625*x6p*cos(x2 - x3) - 4.905*sin(x2);
eq3 = I + T == 0.28125*x4p*cos(x3) - 0.140625*x5^2*sin(x2 - x3) - 0.08*x5 + 0.140625*x5p*cos(x2 - x3) + 0.08*x6 + 0.140625*x6p - 2.7590625*sin(x3);

%Definição do sistema de equações a ser resolvido
eqns = [eq1, eq2, eq3];

%Resolução simbólica do sistema de equações
[y1,y2,y3] = solve(eqns,[x4p,x5p,x6p]);


%Resoluções simbólicas das linhas das matrizes A e B
%Linha 4 da matriz A
A41 = jacobian(y1,x1);
A42 = jacobian(y1,x2);
A43 = jacobian(y1,x3);
A44 = jacobian(y1,x4);
A45 = jacobian(y1,x5);
A46 = jacobian(y1,x6);

%Linha 5 da matriz A
A51 = jacobian(y2,x1);
A52 = jacobian(y2,x2);
A53 = jacobian(y2,x3);
A54 = jacobian(y2,x4);
A55 = jacobian(y2,x5);
A56 = jacobian(y2,x6);

%Linha 6 da matriz A
A61 = jacobian(y3,x1);
A62 = jacobian(y3,x2);
A63 = jacobian(y3,x3);
A64 = jacobian(y3,x4);
A65 = jacobian(y3,x5);
A66 = jacobian(y3,x6);

%Linha 4 da matriz B
B41 = jacobian(y1,F);
B42 = jacobian(y1,T);
B43 = jacobian(y1,I);

%Linha 5 da matriz B
B51 = jacobian(y2,F);
B52 = jacobian(y2,T);
B53 = jacobian(y2,I);

%Linha 6 da matriz B
B61 = jacobian(y3,F);
B62 = jacobian(y3,T);
B63 = jacobian(y3,I);

%Resolução numérica das linhas das matrizes A e B
%Linha 4 da matriz A
A41_sub = subs(A41, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A42_sub = subs(A42, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A43_sub = subs(A43, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A44_sub = subs(A44, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A45_sub = subs(A45, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A46_sub = subs(A46, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);

%Linha 5 da matriz A
A51_sub = subs(A51, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A52_sub = subs(A52, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A53_sub = subs(A53, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A54_sub = subs(A54, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A55_sub = subs(A55, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A56_sub = subs(A56, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);

%Linha 6 da matriz A
A61_sub = subs(A61, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A62_sub = subs(A62, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A63_sub = subs(A63, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A64_sub = subs(A64, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A65_sub = subs(A65, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
A66_sub = subs(A66, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);

%Linha 4 da matriz B
B41_sub = subs(B41, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
B42_sub = subs(B42, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
B43_sub = subs(B43, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);

%Linha 5 da matriz B
B51_sub = subs(B51, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
B52_sub = subs(B52, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
B53_sub = subs(B53, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);

%Linha 6 da matriz B
B61_sub = subs(B61, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
B62_sub = subs(B62, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
B63_sub = subs(B63, [F,T,I,x1,x2,x3,x4,x5,x6], [0,0,0,0,0,0,0,0,0]);
