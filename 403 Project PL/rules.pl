payment(F, L, P) :- commission(F, L, Min, Sales, Crate),
    Sales*Crate > Min,
    P is Sales*Crate.

payment(F, L, P) :- commission(F, L, Min, Sales, Crate),
    Sales*Crate =< Min,
    P is Min.

payment(F, L, P) :- salaried(F, L, P).

payment(F, L, P) :- hourly(F, L, Hours, Rate),
    Hours =< 40,
    P is Rate*Hours.

payment(F, L, P) :- hourly(F, L, Hours, Rate),
    Hours > 40 , Hours =< 50,
    P is Rate*40 + Rate*1.5*(Hours-40).

payment(F, L, P) :- hourly(F, L, Hours, Rate),
    Hours > 50,
    P is Rate*40 + Rate*15 + Rate*2*(Hours - 50).

