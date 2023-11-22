% Yêu cầu 1

male(george_vi).
male(philip).
male(charles).
male(mark_phillips).
male(andrew).
male(edward).
male(william).
male(harry).
male(peter_phillips).
male(james_viscount_severn).

female(elizabeth_ii).
female(margaret).
female(elizabeth_the_queen_mother).
female(diana).
female(camilla).
female(anne).
female(sarah).
female(sophie).
female(kate).
female(meghan).
female(zara_phillips).
female(beatrice).
female(eugenie).
female(louise_mountbatten_windsor).
female(charlotte).
female(savannah_phillips).
female(isla_phillips).
female(mia_grace_tindall).
female(lena_tindall).

parent(george_vi, elizabeth_ii).
parent(george_vi, margaret).
parent(elizabeth_the_queen_mother, elizabeth_ii).
parent(elizabeth_the_queen_mother, margaret).
parent(elizabeth_ii, charles).
parent(elizabeth_ii, anne).
parent(elizabeth_ii, andrew).
parent(elizabeth_ii, edward).
parent(philip, charles).
parent(philip, anne).
parent(philip, andrew).
parent(philip, edward).
parent(diana, william).
parent(diana, harry).
parent(charles, william).
parent(charles, harry).
parent(camilla, tom_parker_bowles).
parent(camilla, laura_parker_bowles).
parent(anne, peter_phillips).
parent(anne, zara_phillips).
parent(mark_phillips, peter_phillips).
parent(mark_phillips, zara_phillips).
parent(andrew, beatrice).
parent(andrew, eugenie).
parent(sarah, beatrice).
parent(sarah, eugenie).
parent(edward, louise_mountbatten_windsor).
parent(edward, james_viscount_severn).
parent(sophie, louise_mountbatten_windsor).
parent(sophie, james_viscount_severn).
parent(william, george).
parent(william, charlotte).
parent(william, louis).
parent(kate, george).
parent(kate, charlotte).
parent(kate, louis).
parent(harry, archie_harrison).
parent(meghan, archie_harrison).
parent(peter_phillips, savannah_phillips).
parent(peter_phillips, isla_phillips).
parent(autumn_kelly, savannah_phillips).
parent(autumn_kelly, isla_phillips).
parent(zara_phillips, mia_grace_tindall).
parent(zara_phillips, lena_tindall).
parent(mike_tindall, mia_grace_tindall).
parent(mike_tindall, lena_tindall).

married(elizabeth_ii, philip).
married(philip, elizabeth_ii).
married(charles, camilla).
married(camilla, charles).
married(william, kate).
married(kate, william).
married(harry, meghan).
married(meghan, harry).
married(anne, timothy_laurence).
married(timothy_laurence, anne).
married(edward, sophie).
married(sophie, edward).
married(peter_phillips, autumn_kelly).
married(autumn_kelly, peter_phillips).
married(zara_phillips, mike_tindall).
married(mike_tindall, zara_phillips).

divorced(diana, charles).
divorced(charles, diana).
divorced(anne, mark_phillips).
divorced(mark_phillips, anne).
divorced(andrew, sarah).
divorced(sarah, andrew).

% Yêu cầu 2

father(Parent,Child) :- parent(Parent,Child), male(Parent).
mother(Parent,Child) :- parent(Parent,Child), female(Parent).
child(Child,Parent) :- parent(Parent,Child).
son(Child,Parent) :- child(Child,Parent), male(Child).
daughter(Child,Parent) :- child(Child,Parent), female(Child).
grandparent(GP,GC) :- parent(GP,P), parent(P,GC).
grandmother(GM,GC) :- grandparent(GM,GC), female(GM).
grandfather(GF,GC) :- grandparent(GF,GC), male(GF).
grandchild(GC,GP) :- grandparent(GP,GC).
grandson(GS,GP) :- grandchild(GS,GP), male(GS).
granddaughter(GD,GP) :- grandchild(GD,GP), female(GD).
spouse(Husband,Wife) :- married(Husband,Wife).
husband(Person,Wife) :- spouse(Person,Wife), male(Person).
wife(Person,Husband) :- spouse(Person,Husband), female(Person).
sibling(Person1,Person2) :- parent(P,Person1), parent(P,Person2), Person1 = Person2.
brother(Person,Sibling) :- sibling(Person,Sibling), male(Person).
sister(Person,Sibling) :- sibling(Person,Sibling), female(Person).
aunt(Person1,Person2) :- parent(P,Person2), sister(Person1,P).
uncle(Person1,Person2) :- parent(P,Person2), brother(Person1,P).
nephew(Person1,Person2) :- aunt(Person2,Person1); uncle(Person2,Person1), male(Person1).
niece(Person1,Person2) :- aunt(Person2,Person1); uncle(Person2,Person1), female(Person1).

% Yêu cầu 3

?- father(Peter_phillips, X).

?- mother(Diana, X).

?- child(X, Harry).

?- son(X, Peter_phillips).

?- daughter(X, Peter_phillips).

?- grandmother(X, Lilibet_diana).

?- grandfather(Mark_phillips, X).

?- grandson(X, Elizabeth_ii).

?- granddaughter(Louise_mountbatten_windsor, X).

?- sibling(X, Lena_tindall).

?- spouse(Autumn_kelly, Peter_phillips).

?- brother(X, Zara_phillips).

?- sister(Louise_mountbatten_windsor, X).

?- sister(Beatrice, X).

?- aunt(X, Harry).

?- uncle(Harry, X).

?- nephew(X, Edward).

?- niece(X, Anne).

?- spouse(Eugenie, X).

?- grandchild(Anne, X).
