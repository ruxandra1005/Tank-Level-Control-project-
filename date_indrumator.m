clear all
close all
clc
%% calcularea coeficientilor k11,k12,k13,k
C = 9;
A = 332.5;
k1 = 0.6241;
k2 = -0.015;
k3 = -0.0006;
k = 0.035;

k11 = k2^2 + 4*(k - k3)*k1;
k12 = 8*(k-k3);
k13 = 2*(k-k3);

keta = 8*(10^-5);

%% identificare

h0 = 10.5;
q0 = 29.18;
href = 13;

%% regulatorul PI
kp = 1.67;
Tp = 160;
Hp = tf(kp, [Tp 1])
T0 = Tp/4;
Ho = tf(1, [T0 1])
Hd = minreal(Ho/(1-Ho))
Hr = minreal((1/Hp) * Hd)

[Kr,Ti] = pidstddata(Hr)

%% perturbatii - feedforward
q_perturb = 40.37;
qref = 32.46;

k_comp = ((href-h0)/(q_perturb - qref))/((href-h0)/(6.25-5.5));

%% perturbatii - cascada

%trebuie sa simulam aprox 10 secunde ca sa afcem identificarea
%intrarii(debitului) pe bucla deschisa pt proiectarea regulatorului

q_cascada = 34.42;
h_cascada = 14.51;

%bucla interna
kpi = 10.2;
Tpi = 0.7325;
Hpi = tf(kpi, [Tpi 1])
T0pi = Tpi/4;
Hopi = tf(1, [T0pi 1])
Hdpi = minreal(Hopi/(1-Hopi))
Hrpi = minreal((1/Hpi) * Hdpi)

[Krpi,Trpi] = pidstddata(Hrpi)

%bucla externa
kpe = 0.26;
Tpe = 260;
Hpe = tf(kpe, [Tpe 1])
T0pe = Tpe/4;
Hope = tf(1, [T0pe 1])
Hdpe = minreal(Hope/(1-Hope))
Hrpe = minreal((1/Hpe) * Hdpe)

[Krpe,Trpe] = pidstddata(Hrpe)
