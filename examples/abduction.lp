% KB:

wobblyWheel :- brokenSpokes.
wobblyWheel :- flatTyre.
flatTyre :- leakyValve.
flatTyre :- puncturedTube.

% Ab:
0 { brokenSpokes, puncturedTube, leakyValve } 3.

% IC:

:- not puncturedTube, leakyValve.

% O:

% wobblyWheel (we want to find what might cause this (goal))

% Add a constraint to ensure that any result that causes wobblyWheel to be false is invalid
% All answer sets where wobblyWheel is false

:- not wobblyWheel.
