%% calcularea coeficientilor k11,k12,k13,k

k1 = 0.624;
k2 = -0.0015;
k3 = -0.0006;
k = 0.035;

k11 = k2^2 + 4*(k - k3)*k1;
k12 = 8*(k-k3);
k13 = 2*(k-k3);

%% calculul randamentului pompei

keta = 8*(10^-5);

%%

   