%% EM's matlab project of Dr. Ghatan
%% Coded by: Naghiloo & Nobakhti

clc ; close all ; clear
%% Define parameters:

% X axis
X0 = 0.6;
c = 1;
abs_x = 0.6;

% Y axis
y0 = 0.6;
d = 0.8;
abs_y = 0.6;
%% steps of unit length: 
disp(['bigger step (range: 5-100) give us more exactly result but depend on' ...
    ' ur PC configuration need much time.'])
disp('So 10 is quicker but not so Exact')
steps = input('Hi Mr. Alinezhad, please enter an step(read upper sentence):');
% step is our node too
dx = 1/steps;
dy = 1/steps;

x = 0:dx:(X0+c+abs_x);
y = 0:dy:(y0+d+abs_y);

A = length(0:dx:X0); % 1st of inner conductor along X axis
B = length(0:dx:X0+c); % 2nd  of inner conductor along X axis
C = length(0:dx:X0+c+abs_x); % outer conductor along X axis
D = length(0:dy:y0); % 1st of inner conductor along Y axis
E = length(0:dy:y0+d); % 2nd of inner conductor along Y axis
F = length(0:dy:y0+d+abs_y); % outer conductor along Y axis

%% Boundary Condition:
Vo = 1; % for example assuming it 1 volt
phi = zeros(F,C); % initialising variable

% outer layaer
phi(1,:) = 0;
phi(F,:) = 0;
phi(:,1) = 0; 
phi(:,C) = 0; 

% Assigning voltage at inner conductor and intialising all free node to 0V

for l = 2:F-1
    for m = 2:C-1
        if (m>=A && m<=B) && (l>=D && l<=E)
           phi(l,m) = Vo;            
        else
           phi(l,m) = 0;
        end
    end
end
  
% solving Laplace equation by Finite-Difference: 
p = 1;
v(:,:,p) = phi;
phi_initial = phi;
error1 = v(:,:,p)-zeros(F,C);
error2 = rms(rms(error1)); % RMS error between two iteration
RMS_err(p) = error2; % Storing RMS error between iterations
while error2 > 1e-30   % iteration
    p = p+1;
    
    
for l = 2:F-1
    
    for m = 2:C-1
        
        if (m>=A && m<=B) && (l>=D && l<=E)
           phi(l,m) = 1;            
        else
           phi(l,m)= (phi(l,m-1)+phi(l,m+1)+phi(l-1,m)+phi(l+1,m))/4;
        end
              
    end
end

v(:,:,p)= phi; 
error1 = v(:,:,p)-v(:,:,p-1);
error2 = rms(rms(error1));
RMS_err(p) = error2; % Storing RMS error between iterations
mesh(x,y,phi,'Linewidth',5)
pause(0.01)
end
%% Graphic settings:
mesh(x,y,phi,'Linewidth',5)
xlabel('x',FontSize=10,Color='m')
ylabel('y',FontSize=10,Color='m')
zlabel('Potential',FontSize=10,Color='m')
title('Potential distribution for coax rectangular',FontSize=14,Color='r')
%% Calculating charge of outside the inner conductor & then C by
 % Gauss's Law
INT =sum((phi(D,A:B)- phi(D-1,A:B))) + sum ((phi(E,A:B)-phi(E+1,A:B))) + sum((phi(D:E,A)- phi(D:E,A-1))) + sum((phi(D:E,B)-phi(D:E,B+1)));
% epsilon = e0 * er = e0 (due to er==1)
epsilon = 8.854187e-12; % Permitivity of free space
Q = epsilon*INT; % Charge enclosed

V= Vo-0; % Voltage difference between inner(V=0) and outer conductor
Capacitance = Q/V % Capcitance per unit of length
