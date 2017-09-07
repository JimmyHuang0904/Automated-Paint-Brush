% This script sets default values for the Paint Booth Factory

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Values you should not change %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initial joint position assigned to velocity integrators
InitQ0   = 1.759;            % Initial position
InitQ1   = -112.05;          % Initial position
InitQ2   = 7.245;            % Initial position


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Values you should set in Controller.m %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ================
% CONTROLLER GAINS
% ================
% PID Controller
PID0 = [1 0 0];
PID1 = [1 0 0];
PID2 = [1 0 0];

% ==========
% THROUGHPUT
% ==========
PaintTime = 9.0;  % Time spent painting truck
ResetTime = 1.0;  % Time spent resetting robot position for next truck

StartX    = 0.0;  % Initial position of truck when painting starts


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Values you should set in Robot.m %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ========
%    Q0
% ========

% Pump Dynamics & Saturation
Pump0n   = [1];              % Numerator
Pump0d   = [1];              % Denominator
Pump0sat = Big;

% Mechanical Dynamics
Mech0n = [1];                % Numerator
Mech0d = [1];                % Denominator

% Joint Limit
JntMin0 = -Big;
JntMax0 =  Big;

% Controller Feedback Gain
FB0    = 0;


% ========
%    Q1
% ========

% Amplifier Dynamics & Saturation
Amp1n   = [1];               % Numerator
Amp1d   = [1];               % Denominator
AmpSat1 = Big;

% Electrical Dynamics & Torque Constant
Elec1n = [1];                % Numerator
Elec1d = [1];                % Denominator
TConst1 = 1;

% Mechanical Dynamics & Back EMF
Mech1n = [1];                % Numerator
Mech1d = [1];                % Denominator
BackEMF1 = 0;

% Gearbox Reduction Ratio & Joint Limit
Gear1   = 1;
JntMin1 = -Big;
JntMax1 =  Big;

% Gravity
Grav = 0;

% Controller Feedback Gain
FB1    = 0;


% ========
%    Q2
% ========

% Amplifier Dynamics & Saturation
Amp2n   = [1];               % Numerator
Amp2d   = [1];               % Denominator
AmpSat2 = Big;

% Electrical Dynamics & Torque Constant
Elec2n = [1];                % Numerator
Elec2d = [1];                % Denominator
TConst2 = 1;

% Mechanical Dynamics & Back EMF
Mech2n = [1];                % Numerator
Mech2d = [1];                % Denominator
BackEMF2 = 0;

% Gearbox Reduction Ratio & Joint Limit
Gear2   = 1;
JntMin2 = -Big;
JntMax2 =  Big;

% Controller Feedback Gain
FB2    = 0;
