clear all;
close all;

syms a1 a2 a3 d1 d2 d3 k1 k2 k3 a d k
% a1 = a;
% a2 = a;
% a3 = a;
% d1 = 1 .* d;
% d2 = 1 .* d;
% d3 = 1 .* d;
% k1 = 1 .* k;
% k2 = 1 .* k;
% k3 = 1 .* k;
a1 = [0.1:0.01:4.9];
a2 = [0.1:0.01:4.9];
[a1,a2] = meshgrid(a1,a1);
a3 = 2.5;
d1 = 1;
d2 = 1;
d3 = 1;
k1 = 1;
k2 = 0.5;
k3 = 1;

Ca = (a1 - a2)./(d1 + d2);
a12 = (k1 + k2) .* a1 .* a2 ./ (k1 .* a2 + k2 .* a1);
k12 = (k1 + k2);
kappa12 = k1 .* k2 .* a12 ./ (k1 .* a2 + k2 .* a1)

Cb = (a12 - a3) ./ (d1 + d2 + d3);
a123 = (k12 + k3) .* a12 .* a3 ./ (k12 .* a3 + k3 .* a12);
kappa123 = k12 .* k3 .* a123 ./ (k12 .* a3 + k3 .* a12)

Ka = kappa12 .* (d1 + d2)^2;
Kb = kappa123 .* (d1 + d2 + d3)^2;

% C = (Ka + Kb) .* Ca .* Cb
% C = (Ka + Kb) .* Ca .* Cb ./ (Ka .* Cb + Kb .* Ca)
C = (Ka .* Ca + Kb .* Cb) ./ (Ka + Kb);
K = Ka + Kb;
contourf(a1, a2, C, 10, 'ShowText', 'on')
title("Spontaneous curvature")
xlabel("top area")
ylabel("med area")
colorbar