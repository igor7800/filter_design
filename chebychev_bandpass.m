%Bandpass chebychev filter example
clear;
clf;
order = 6;    
ripple = 0.5; %ripple in db
omega_p = ([20 20e3]*pi*2);
type='bandpass';

% Zero-Pole-Gain design
[num,denum] = cheby1(order,ripple,omega_p,type,'s');
H = tf(num,denum)
i = impulse(H);         % Impulse Response
s = step(H);            % Step Response

%plot H(s)
bode(H)
grid;

%plot impulse response
figure
plot(i)
xlabel('Time')
ylabel('Amplitude')
title('Normalized Impulse Response')
grid;

%plot step response
figure
plot(s)
xlabel('Time')
ylabel('Amplitude')
title('Normalized Step Response')
grid;

%plot poles and zeros
poles =roots(denum)
zeros =roots(num)
figure
zplane(zeros,poles);
xlabel('Sigma')
ylabel('j * Omega')
title('Poles of the filter in S-plane')
grid;






