clear all
close all
clc

syms th1(t)
syms m1 l1 lc1 Ixx1 Iyy1 Izz1 real

Q   = th1;
Qp  = diff(Q,t);
Qpp = diff(Qp,t);

P = [l1*cos(th1);
     l1*sin(th1);
     0];

R = [cos(th1) -sin(th1) 0;
     sin(th1)  cos(th1) 0;
     0         0        1];

PO = P;
RO = R;

Jv = cross([0;0;1], PO);
Jw = [0;0;1];

V = Jv * Qp;
W = Jw * Qp;

P01 = [lc1*cos(th1);
       lc1*sin(th1);
       0];

V_total = V + cross(W,P01);

I1 = [Ixx1 0 0;
      0 Iyy1 0;
      0 0 Izz1];

K1 = 1/2*m1*(V_total.'*V_total) + 1/2*(W.'*(I1*W));
K1 = simplify(K1);

pretty(K1)