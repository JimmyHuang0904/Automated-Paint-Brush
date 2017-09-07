% This script sets the controller parameters for the Paint Booth Factory

% ================
% CONTROLLER GAINS
% ================
% Find the values that are stable and allow you to maximize throughtput
% as much as possible without violating the Position Error constraint.

KD0 = 0.0009;
KD1 = 1;
KD2 = -0.068;

Nvalue = 100;
%I changed the N(divisor) in the PID with their corresponding matrix. Eg. PID0(4) = 100. 
%I was just playing around with the divisor just to see what it will
%change. We set N = 100 to take part in the Highest Throughput Competition

PID0=[0.731*KD0     0*KD1       1*KD0     Nvalue];
PID1=[205*KD1       0.01*KD1    1*KD1     Nvalue];
PID2=[-325*KD2      -208*KD2    1*KD2     Nvalue];
%PID2 was auto-tuned values which I normalized the KD2 to 1 and scale the
%KP2 and KI2 by the value of KD2. When we autotune, 
%  P = 22.08355
%  I = 14.13059
%  D = -0.068

%PID2=[20*KD2 200*KD2 1*KD2 Nvalue];

% ==========
% THROUGHPUT
% ==========
% Reduce these values as much as possible to increase throughput 
% as much as possible without violating the Position Error constraint.

PaintTime = 3.5;    % Time spent painting truck
ResetTime = 0.4;    % Time spent resetting robot position for next truck

% ===========
% JOINT LIMIT
% ===========
% Modify this value to adjust where the truck is when you begin painting
% it to avoid running into the limit of the Q0 prismatic joint.

StartX    = 0;    % Initial position of truck when painting starts
