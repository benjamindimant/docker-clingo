p(1) :- not q(1), r(1).
p(2) :- not q(2), r(2).
q(1) :- not p(1), r(1).
q(2) :- not p(2), r(2).
r(1).
r(2).
