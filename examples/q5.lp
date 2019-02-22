% KB:
headache(X) :- jaundice(X).
headache(X) :- migraine(X).
sickness(X) :- stomachBug(X).

% Ab:
0 { jaundice(bob), migraine(bob), yellowEyes(bob) } 3.

% IC:
:- migraine(X), jaundice(X).
:- jaundice(X), not yellowEyes(X).
:- jaundice(X), not sickness(X).

% O: headache(bob)
:- not headache(bob).

# minimize [ jaundice(bob)=1, migraine(bob)=1, yellowEyes(bob)=1 ]
