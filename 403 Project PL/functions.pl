count(Op, Ref, Count) :- (
        Op='eq', findall(Z, (payment(X, Y, Z), Z=:=Ref), List),  length(List, Count);
        Op='ne', findall(Z, (payment(X, Y, Z), Z=\=Ref), List),  length(List, Count);
        Op='gt', findall(Z, (payment(X, Y, Z), Z>Ref), List),  length(List, Count);
        Op='ge', findall(Z, (payment(X, Y, Z), Z>=Ref), List),  length(List, Count);
        Op='lt', findall(Z, (payment(X, Y, Z), Z<Ref), List),  length(List, Count);
        Op='le', findall(Z, (payment(X, Y, Z), Z=<Ref), List),  length(List, Count)
        ).



total(Op, Ref, Total) :- (
        
        Op='ge', findall(Z, (payment(X, Y, Z), Z>=Ref), List), sum_list(List, Total);
        Op='eq', findall(Z, (payment(X, Y, Z), Z=:=Ref), List), sum_list(List, Total);
        Op='ne', findall(Z, (payment(X, Y, Z), Z=\=Ref), List), sum_list(List, Total);
        Op='gt', findall(Z, (payment(X, Y, Z), Z>Ref), List), sum_list(List, Total);
        Op='lt', findall(Z, (payment(X, Y, Z), Z<Ref), List), sum_list(List, Total);
        Op='le', findall(Z, (payment(X, Y, Z), Z=<Ref), List), sum_list(List, Total)
).

min(Op, Ref, Min) :- (
        Op='gt', findall(Z, (payment(X, Y, Z), Z>Ref), List), min_list(List, Min);
        Op='eq', findall(Z, (payment(X, Y, Z), Z=:=Ref), List), min_list(List, Min);
        Op='ne', findall(Z, (payment(X, Y, Z), Z=\=Ref), List), min_list(List, Min);
        Op='ge', findall(Z, (payment(X, Y, Z), Z>=Ref), List), min_list(List, Min);
        Op='lt', findall(Z, (payment(X, Y, Z), Z<Ref), List), min_list(List, Min);
        Op='le', findall(Z, (payment(X, Y, Z), Z=<Ref), List), min_list(List, Min)
).

max(Op, Ref, Max) :- (
        Op='gt', findall(Z, (payment(X, Y, Z), Z>Ref), List), max_list(List, Max);
        Op='eq', findall(Z, (payment(X, Y, Z), Z=:=Ref), List), max_list(List, Max);
        Op='ne', findall(Z, (payment(X, Y, Z), Z=\=Ref), List), max_list(List, Max);
        Op='ge', findall(Z, (payment(X, Y, Z), Z>=Ref), List), max_list(List, Max);
        Op='lt', findall(Z, (payment(X, Y, Z), Z<Ref), List), max_list(List, Max);
        Op='le', findall(Z, (payment(X, Y, Z), Z=<Ref), List), max_list(List, Max)
).

avg(Op, Ref, Avg) :- (
        
        Op='le', findall(Z, (payment(X, Y, Z), Z =< Ref), List), sum_list(List, Total), length(List, Count), Avg is Total/Count;
        Op='lt', findall(Z, (payment(X, Y, Z), Z < Ref), List), sum_list(List, Total), length(List, Count), Avg is Total/Count;
        Op='ge', findall(Z, (payment(X, Y, Z), Z >= Ref), List), sum_list(List, Total), length(List, Count), Avg is Total/Count;
        Op='gt', findall(Z, (payment(X, Y, Z), Z > Ref), List), sum_list(List, Total), length(List, Count), Avg is Total/Count;
        Op='eq', findall(Z, (payment(X, Y, Z), Z =:= Ref), List), sum_list(List, Total), length(List, Count), Avg is Total/Count;
        Op='ne', findall(Z, (payment(X, Y, Z), Z =\= Ref), List), sum_list(List, Total), length(List, Count), Avg is Total/Count
).

list(Op, Ref, List) :- (
        Op='ge', findall([X, Y, Z], (payment(X, Y, Z), Z >= Ref), List);
        Op='eq', findall([X, Y, Z], (payment(X, Y, Z), Z =:= Ref), List);
        Op='gt', findall([X, Y, Z], (payment(X, Y, Z), Z > Ref), List);
        Op='ne', findall([X, Y, Z], (payment(X, Y, Z), Z =\= Ref), List);
        Op='lt', findall([X, Y, Z], (payment(X, Y, Z), Z < Ref), List);
        Op='le', findall([X, Y, Z], (payment(X, Y, Z), Z =< Ref), List)
).


