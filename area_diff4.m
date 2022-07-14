clear all;
close all;

syms a1 a2 a3 a4 d1 d2 d3 d4 k1 k2 k3 k4 a d k
a1 = [0.1:0.01:4.9];
am = [0.1:0.01:4.9];
% a1 = [20];
% am = [0.5];
[a1, am] = meshgrid(a1, am);
a2 = am;
a3 = am;
a4 = 2.5;
d1 = 1;
d2 = 0.5;
d3 = 0.5;
d4 = 1;
k1 = 0.5;
k2 = 1;
k3 = 1;
k4 = 0.2;
% a1 = [1:0.01:2];
% a2 = [1:0.01:2];
% a3 = [1:0.01:2];
% a4 = [1:0.01:2];
% d1 = 1 .* d;
% d2 = 1 .* d;
% d3 = 1 .* d;
% d4 = 1 .* d;
% k1 = 1 .* k;
% k2 = 1 .* k;
% k3 = 1 .* k;
% k4 = 1 .* k;
% a1 = [1:0.01:2];
% a2 = [1:0.01:2];
% [a1,a2] = meshgrid(a1,a1);
% a3 = 1;
% d1 = 1;
% d2 = 1;
% d3 = 1;
% k1 = 1;
% k2 = 1;
% k3 = 1;

Ca = (a1 - a2) ./ (d1 + d2);
a12 = (k1 + k2) .* a1 .* a2 ./ (k1 .* a2 + k2 .* a1);
k12 = (k1 + k2);
kappa12 = k1 .* k2 .* a12 ./ (k1 .* a2 + k2 .* a1)

Cb = (a3 - a4) ./ (d3 + d4);
a34 = (k3 + k4) .* a3 .* a4 ./ (k3 .* a4 + k4 .* a3);
k34 = (k3 + k4);
kappa34 = k3 .* k4 .* a34 ./ (k3 .* a4 + k4 .* a3)

Cc = (a12 - a34) ./ (d1 + d2 + d3 + d4);
a1234 = (k12 + k34) .* a12 .* a34 ./ (k12 .* a34 + k34 .* a12);
k1234 = (k12 + k34);
kappa1234 = k12 .* k34 .* a1234 ./ (k12 .* a34 + k34 .* a12)

Ka = kappa12 .* (d1 + d2)^2;
Kb = kappa34 .* (d3 + d4)^2;
Kc = kappa1234 .* (d1 + d2 + d3 + d4)^2;

% Cab = (Ka + Kb) .* Ca .* Cb ./ (Ka .* Cb + Kb .* Ca)
% K = Ka + Kb + Kc
% C = K .* Cab .* Cc ./ ((Ka + Kb) .* Cc + Kc .* Ca)

Cab = (Ka .* Ca + Kb .* Cb) ./ (Ka + Kb);
C = ((Ka + Kb) .* Cab + Kc .* Cc) ./ (Ka + Kb + Kc);

% C(C>1) = 1
% C(C<-1) = -1

subplot(2, 2, 1)
contourf(a1, am, C, 10, 'ShowText', 'on')
title("Spontaneous curvature")
xlabel("top area")
ylabel("med area")
colorbar

subplot(2, 2, 2)
contourf(a1, am, Cab, 10, 'ShowText', 'on')
title("Cab")
xlabel("top area")
ylabel("med area")
colorbar

subplot(2, 2, 3)
contourf(a1, am, Cc, 10, 'ShowText', 'on')
title("Cc")
xlabel("top area")
ylabel("med area")
colorbar


% clim([-0.1, 0.1])
% zlim([-1 1])
