clear;
clf;
fprintf('\n What filter do you want to design: ')
btype = input('\n Enter (b) for bandpass or (l) for lowpass (h) for highpass or (s) for stopband: ','s');

%%%%%%%% BANDPASS %%%%%%
if (btype == 'b')
    type='bandpass';
    fprintf('\n Enter the Approximation method You will use')
    ftype = input('\n Enter (b) for Butterworth or (c) for Chebyshev : ','s');
    if (ftype == 'b')
        fprintf('\n You choose Butterworth Approximation : ')
        order = input('\n Enter order of the filter: ');
        f_p1 = input('Enter f_p1 at hightpass passband ');
        f_p2 = input('Enter f_p2 at lowppass passband  ');     
        omega_p = ([f_p1 f_p2]*pi*2);
        % Zero-Pole-Gain design
        [num,denum] = butter(order,omega_p,type,'s');
        H = tf(num,denum)
        
    end
    
    if (ftype == 'c')
        fprintf('\n You choose Chebyshev Approximation : ')
        order = input('\nEnter order of the filter: ');
        ripple = input('Enter ripple at passband in dB: ');
        f_p1 = input('Enter f_p1 at hightpass passband ');
        f_p2 = input('Enter f_p2 at lowppass passband  ');
        omega_p = ([f_p1 f_p2]*pi*2);
        % Zero-Pole-Gain design
        [num,denum] = cheby1(order,ripple,omega_p,type,'s');
        H = tf(num,denum)
    end
end

%%%%%%% LOWPASS %%%%%%%
if (btype == 'l')
    type='low';
    fprintf('\n Enter the Approximation method You will use')
    ftype = input('\n Enter (b) for Butterworth or (c) for Chebyshev : ','s');
    if (ftype == 'b')
        fprintf('\n You choose Butterworth Approximation : ')
        order = input('\n Enter order of the filter: ');
        f_p = input('Enter f_p: ');
        omega_p = (f_p*pi*2);
        % Zero-Pole-Gain design
        [num,denum] = butter(order,omega_p,type,'s');
        H = tf(num,denum)
        
    end
    
    if (ftype == 'c')
        fprintf('\n You choose Chebyshev Approximation : ')
        order = input('\nEnter order of the filter: ');
        ripple = input('Enter ripple at passband in dB: ');
        f_p = input('Enter f_p: ');
        omega_p = (f_p*pi*2);
        % Zero-Pole-Gain design
        [num,denum] = cheby1(order,ripple,omega_p,type,'s');
        H = tf(num,denum)
    end
end

%%%%%% HIGHPASS %%%%%%%
if (btype == 'h')
    type='high';
    fprintf('\n Enter the Approximation method You will use')
    ftype = input('\n Enter (b) for Butterworth or (c) for Chebyshev : ','s');
    if (ftype == 'b')
        fprintf('\n You choose Butterworth Approximation : ')
        order = input('\n Enter order of the filter: ');
        f_p = input('Enter f_p: ');
        omega_p = (f_p*pi*2);
        % Zero-Pole-Gain design
        [num,denum] = butter(order,omega_p,type,'s');
        H = tf(num,denum)
        
    end
    
    if (ftype == 'c')
        fprintf('\n You choose Chebyshev Approximation : ')
        order = input('\nEnter order of the filter: ');
        ripple = input('Enter ripple at passband in dB: ');
        f_p = input('Enter f_p: ');
        omega_p = (f_p*pi*2);
        % Zero-Pole-Gain design
        [num,denum] = cheby1(order,ripple,omega_p,type,'s');
        H = tf(num,denum)
    end
end


%%%%%% STOPBAND  %%%%%%
if (btype == 's')
    type='stop';
    fprintf('\n Enter the Approximation method You will use')
    ftype = input('\n Enter (b) for Butterworth or (c) for Chebyshev : ','s');
    if (ftype == 'b')
        fprintf('\n You choose Butterworth Approximation : ')
        order = input('\n Enter order of the filter: ');
        f_s1 = input('Enter f_s1 at lowpass stopband ');
        f_s2 = input('Enter f_s2 at highpass stopband ');     
        omega_p = ([f_s1 f_s2]*pi*2);
        % Zero-Pole-Gain design
        [num,denum] = butter(order,omega_p,type,'s');
        H = tf(num,denum)
        
    end
    
    if (ftype == 'c')
        fprintf('\n You choose Chebyshev Approximation : ')
        order = input('\nEnter order of the filter: ');
        ripple = input('Enter ripple at passband in dB: ');
        f_s1 = input('Enter f_s1 at lowpass stopband ');
        f_s2 = input('Enter f_s2 at highpass stopband ');     
        omega_p = ([f_s1 f_s2]*pi*2);
        % Zero-Pole-Gain design
        [num,denum] = cheby1(order,ripple,omega_p,type,'s');
        H = tf(num,denum)
    end
end

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






