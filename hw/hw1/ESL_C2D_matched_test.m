%% ESL_C2D_matched test
close all
num = [1 5 6];
den = [1 -16 83 -140];
h = 0.1;% Time step size
omegac = 10;% critical frequency

Ds = RR_tf(num,den);% Define continuous functions
Ms = tf(num,den);

Dz = ESL_C2D_matched(Ds,h,omegac); %discretize
Mz = c2d(Ms,h,'matched'); %discretize with MATLAB method

figure(1)
hold on
RR_bode(Ds)
RR_bode(Dz)
hold off

figure(2)
hold on
bode(Ms)
bode(Mz)
hold off
