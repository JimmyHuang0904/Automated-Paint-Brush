% This script contains all physical constants and specifications for the
% Paint Booth Factory

%%%%%%%%%%%%%%%%%%%%%%
% Physical Constants %
%%%%%%%%%%%%%%%%%%%%%%
G = 9.81;               % m/s^2
FtPerM = 3.28;          % ft/m
RadPerDeg = pi/180;     % rad/deg
DegPerRad = 180/pi;     % deg/rad

Big = 1e6;              % General purpose large number


%%%%%%%%%%%%%%%%%%
% Specifications %
%%%%%%%%%%%%%%%%%%

%  Prismatic Joint 0
% ===================

% Pump
PK0  = 600;              % Pump gain (PSI/V)
PT0  = 10;               % Pump time constant (ms)
PM0  = 150;              % Pump max (PSI)

% Actuator
QL0 = -0.5;              % Joint Lower Limit (m)
QU0 = 4.5;               % Joint Upper Limit (m)

ID0 = 25;                % Cross-sectional Cylinder ID (cm)
M0  = 0;                 % Unknown Mass of Cylinder & Hyd Fluid
B0  = 0;                 % Unknown Friction of Cylinder & Hyd Fluid


%  Rotary Joints
% ===============

% Amplifier
R1  = 1;                 % R1 (Kohm)
R2  = 4;                 % R2 (Kohm)
C1  = 5;                 % C1 (uF)
C2  = 2;                 % C2 (uF)
VSS = 480;               % Vss (V)

% Motor : Mechanical
MM = 25;                 % Motor Mass (Kg)
MJ = 1.6e5;              % Motor Inertia (gcm^2)
MB = 650;                % Motor Friction (gcm^2/s)

% Motor : Electrical
ML = 1.2;                % Motor Inductance (mH)
MR = 75;                 % Motor Resistance (mohm)
MT = 5000;               % Motor Torque Const (mNm/A)
ME = 25;                 % Motor Back EMF Const (RPM/V)


%  Joint 1
% =========
L1 = 2.5;                % Link Length (m)
M1 = 780;                % Link Mass (g)

QL1 = -180;              % Joint Lower Limit (deg)
QU1 = 90;                % Joint Upper Limit (deg)

% Gear
GM1 = 17000;             % Gear Mass (g)
GJ1 = 98;                % Gear Inertia (gm^2)
GB1 = 2;                 % Gear Friction (gm^2/s)
GR1 = 50;                % Gear Ratio (pure)


% Joint 2
% ========
L2 = 0.75;               % Link Length (m)

QL2 = -144;              % Joint Lower Limit (deg)
QU2 = 144;               % Joint Upper Limit (deg)

% Gear
GM2 = 7000;              % Gear Mass (g)
GJ2 = 3.3;               % Gear Inertia (gm^2)
GB2 = 0.65;              % Gear Friction (gm^2/s)
GR2 = 5;                 % Gear Ratio (pure)
