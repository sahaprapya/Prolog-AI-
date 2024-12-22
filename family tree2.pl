%male
male(abid).
male(anik).
male(shopon).
male(rahman).

%female
female(riya).
female(nayona).
female(ruma).

%parent
parent(riya,anik).
parent(riya,abid).
parent(anik,nayona).
parent(anik,rahman).
parent(abid,shopon).
parent(abid,ruma).

%rules
father(X,Y) :- parent(X,Y),male(X).
mother(X,Y) :- parent(X,Y),female(X).

sibling(X,Y) :- parent(Z,X),parent(Z,Y),X\=Y.

brother(X,Y) :- sibling(X,Y),male(X).
sister(X,Y) :- sibling(X,Y),female(X).

grandfather(X,Z) :-parent(X,Y),parent(Y,Z),male(X).
grandmother(X,Z) :- parent(X,Y),parent(Y,Z),female(X).
