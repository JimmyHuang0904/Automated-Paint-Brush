% This script sets the trajectory for the Paint Booth Factory

%%%%%%%%%%%%%%%%%%%%%%
% Desired Trajectory %
%%%%%%%%%%%%%%%%%%%%%%
% Robot XY-Theta Trajectory
Xd   = [0.0  0.0  1.0  1.5  2.9  2.9  3.9  4.1  5.6  5.8  6.7  6.7  8.0];
Yd   = [0.0  0.8  0.8  1.3  1.4  0.3  0.3  0.4  0.4  0.3  0.3  0.1  0.0];
Td   = [-45  -45  -45  -45 -135 -135 -135 -135 -135 -135 -135 -135  -45];
Td   = Td * RadPerDeg;
Time = [  0    1    2    3    4    5    6  6.2  7.5  7.7  8.7    9];

% Belt Speed
BeltX    = [0 -8];
BeltTime = [0  1];

% Adjust starting X position
BeltX = BeltX + StartX;

% Process Time Vectors
Time = Time * PaintTime / max(Time);
Time = [Time max(Time)+ResetTime];
BeltTime = BeltTime * max(Time);
TotalTime = PaintTime+ResetTime;
SampleTime = TotalTime / 500;
