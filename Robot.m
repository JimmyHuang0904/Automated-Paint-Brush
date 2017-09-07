% This script sets all model  & controller parameters for the 
% Paint Booth Factory

% Example: Specifying a Dynamics Block
% n = [1 2 3];
% d = [4 5 6];
% Transfer Function = (s^2 + 2s + 3) / (4s^2 + 5s + 6)

% ===============
% NORMALIZE UNITS
% ===============
% Example:
% Mass      (Kg)
M1 = 1.2956;             % Convert g -> Kg

%Starting Point

% ========
%    Q0
% ========


% Pump
PT0 = 0.0100;                  % Convert ms --> s             Pump Time Const
PK0 = 4136856;        % Pump gain (PSI/V) --> Pa/V
PM0 = 1034214;        % PSI --> Pa
M0=95.78;

% ----

% Cylinder
ID0 = 0.25;           % Convert cm --> m              Cross-sectional Cylinder ID

% --------

% Feedback

FB0 = 1;                    %Change from 0 --> 1 Direct Feedback

% --------


% ========
%    Q1
% ========

QL1 = QL1 * RadPerDeg;      % Joint Lower Limit (deg) --> Rad
QU1 = QU1 * RadPerDeg;      % Joint Upper Limit (deg) --> Rad

% Amp
R1 = R1 * 1e3;              % Convert Kohm --> ohm
R2 = R2 * 1e3;              % Convert Kohm --> ohm
C1 = C1 * 1e-6;             % Convert uF --> F
C2 = C2 * 1e-6;             % Convert uF --> F

% ---

% Motor
    % - Mechanical
MJ = 0.016;     % Convert gcm^2 --> Kgm^2       Motor Inertia
MB = 6.5e-05;     % Convert gcm^2/s --> Kgm^2/s   Motor Friction
    % - Electrical
ML = ML * 1e-3;             % Convert mH --> H              Motor Inductance
MR = MR * 1e-3;             % Convert mohm --> ohm          Motor Resistance
MT = MT * 1e-3;             % Convert mNm/A --> Nm/A        Motor Torque Const
ME = 0.3820;                % Convert RPM/V --> Rad/s/V     Backward EMF
    

% -----

% Gear
GM1 = GM1 * 1e-3;           % Convert g --> Kg              Gear Mass
GJ1 = GJ1 * 1e-3;           % Convert gm^2 --> Kgm^2        Gear Inertia
GB1 = GB1 * 1e-3;           % Convert gm^2/s --> Kgm^2/s    Gear Friction

% ----

% Gravity
Grav = 12.7098;
%Grav are the components that are affected by gravity and 
%would generate torque on the motor. There are two components 
%to this which first are the motor and gear mass of joint Q2 
%(GM2 +MM) from a distance of link 1(L1) and also the actual 
%link mass(M1).

% -------

% Feedback

FB1 = 1;                    %Change from 0 --> 1 Direct Feedback


% --------


% ========
%    Q2
% ========

QL2 = QL2 * RadPerDeg;      % Joint Lower Limit (deg)
QU2 = QU2 * RadPerDeg;      % Joint Upper Limit (deg)

% Amp

    % Same as Amp 1

% ---

% Motor

    % Same as Motor 1

% -----

% Gear
GM2 = GM2 * 1e-3;           % Convert g --> Kg              Gear Mass
GJ2 = GJ2 * 1e-3;           % Convert gm^2 --> Kgm^2        Gear Inertia
GB2 = GB2 * 1e-3;           % Convert gm^2/s --> Kgm^2/s    Gear Friction

% ----

% Feedback

FB2 = 1;                    %Change from 0 --> 1 Direct Feedback


% --------


% ==================
% TRANSFER FUNCTIONS
% ==================
% Compute transfer functions from above values and perform system analysis
% You may prefer to put this section in a separate .m file

% Setting values first
Pump0sat = PM0;             %Pump Saturation Values

JntMin0 = QL0;              %Pump Lower Joint Limit
JntMax0 = QU0;              %Pump Upper Join Limit

AmpSat1 = VSS;              %Voltage Amplitude Saturation Value
AmpSat2 = VSS;              %Voltage Amplitude Saturation Value

TConst1 = MT;               %Torque Constant for Q1
TConst2 = MT;               %Torque Constant for Q2

BackEMF1 = ME;            %Back EMF of Motor Q1
BackEMF2 = ME;            %Back EMF of Motor Q2

JntMin1 = QL1;              %Joint Q1 Lower Limit
JntMax1 = QU1;              %Joint Q1 Upper Limit

JntMin2 = QL2;              %Joint Q2 Lower Limit
JntMax2 = QU2;              %Joint Q2 Upper Limit

Gear1 = 1/GR1;              %Forward Gear Ratio for Q1
Gear2 = 1/GR2;              %Forward Gear Ratio for Q2




% Amp 1 and 2 Transfer Functions
Amp1n =  [(C1+C2)*R1*R2 R1+R2];
Amp1d =  [C2*R1*R2 R1];

Amp2n =  [(C1+C2)*R1*R2 R1+R2];
Amp2d =  [C2*R1*R2 R1];
%The power amplifiers for Q1 and Q2 are non-inverting Op 
%Amps with a resistor and capacitor in parallel for both 
%Z1 and Z2 components.

% Pump Transfer Function
Pump0n = [PK0*100];     %Pump gain in pascals
Pump0d = [1 100];   
%With the time constant known and it being a single pole 
%system the denominator becomes s + 1/tau.

% Motor Transfer Function
Mech0n = [3.4361];
Mech0d = [95.780 70];  
%The values of the mass and friction of the pump was found by
%finding the rise time and time constant of the impulse of Q0
%for the function, it is mass of Q0 and friction of Q0 respectively.


% ========
%    Q1
% ========

Elec1n = [1];
Elec1d = [0.0012 0.075];
%This is simply the motor inductance and resistance in series
Mech1n = [1];
Mech1d = [0.1947 0.0021];
%The mechanical dynamics relys on 2 factors, Inertia and 
%friction. The inertia for Q1 includes both gear and motor 
%inertias of Q1 and Q2 as well as inertia from the mass of 
%joint Q2. Friction is sum of the gear and mass friction 
%from Q1


% ========
%    Q2
% ========

Elec2n = [1];
Elec2d = [ML MR];
%Same reasoning as Q1 electrical dynamics
Mech2n = [1];
Mech2d = [0.0193 7.15e-04];
%Since negligent mass is attached to Q2, total inertia is
%inertia from the the gear and motor of Q2. Total friction
%is also the sum of the friciton from the gear and motor.


%Unseen Variable
B0 = 70;
B1 = 0.0021;
B2 = 7.15e-04;
BeltTime = [0,10];
BeltX = [0,-8];
TConst = 5;
d0 = 1000;
d1 = 8;
n0 = 5000;
n1 = 28;
XSecArea = 0.0491;




%%%%%%

Pump0 = tf(Pump0n, Pump0d);

Amp1 = tf(Amp1n, Amp1d);
Amp2 = tf(Amp2n, Amp2d);
Elec1 = tf(Elec1n, Elec1d);
Elec2 = tf(Elec2n, Elec2d);
Mech1 = tf(Mech1n, Mech1d);
Mech2 = tf(Mech2n, Mech2d);

Motor0n = 3.436;
Motor0d = [95.78 70 0];
Motor0 = tf(Motor0n, Motor0d);

Motor1n = 5;
Motor1d = [0.0002336 0.0146 1.91 0];
Motor1 = tf(Motor1n, Motor1d);

Motor2n = 5;
Motor2d = [2.316e-05 0.001148 1.91 0];
Motor2 = tf(Motor2n, Motor2d);


%%%%%%

%PIDQ0n = [1  70/95.78 0];
PIDQ0n = [1 70/95.78 0];
PIDQ0d = [1 0];
Q0PID = tf(PIDQ0n, PIDQ0d);
%rlocus(Pump0*Motor0*Q0PID)

PIDQ1n = [1 100 2500];  %to cancel out the poles it should be [1 125 0]
PIDQ1d = [1 0];
Q1PID = tf(PIDQ1n, PIDQ1d);
%rlocus(Amp1*Motor1*Gear1*Q1PID)

PIDQ2n = [1 125 0];
PIDQ2d = [1 0];
Q2PID = tf([1 -325 -208], [1 0]);
%rlocus(Amp2*Motor2*Gear2*Q2PID)
