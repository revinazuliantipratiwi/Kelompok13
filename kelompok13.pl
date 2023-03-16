posisi(kiri).
posisi(kanan).
periksa((Orang, Domba, Serigala, Wortol)) :-
    posisi(Orang),
    posisi(Domba),
    posisi(Serigala),
    posisi(Wortol),
    Orang == Domba.
periksa((Orang, Domba, Serigala, Wortol)) :-
    posisi(Orang),
    posisi(Domba),
    posisi(Serigala),
    posisi(Wortol),
    Orang == Wortol,
    Domba \= Serigala.
periksa((Orang, Domba, Serigala, Wortol)) :-
    posisi(Orang),
    posisi(Domba),
    posisi(Serigala),
    posisi(Wortol), Orang == Serigala, Domba \= Wortol.

step((Orang1, Domba, Serigala, Wortol), 'Orang', (Orang2, Domba, Serigala, Wortol)) :-
    periksa((Orang2, Domba, Serigala, Wortol)),
    Orang1 \= Orang2.

step((Orang1, Domba1, Serigala, Wortol), 'Domba', (Orang2, Domba2, Serigala, Wortol)) :-
    periksa((Orang2, Domba2, Serigala, Wortol)),
    Orang1 \= Orang2, Domba1 \= Domba2.

step((Orang1, Domba, Serigala1, Wortol), 'Serigala', (Orang2, Domba, Serigala2, Wortol)) :-
    periksa((Orang2, Domba, Serigala2, Wortol)),
    Orang1 \= Orang2, Serigala1 \= Serigala2.

step((Orang1, Domba, Serigala, Wortol1), 'Wortol', (Orang2, Domba, Serigala, Wortol2)) :-
    periksa((Orang2, Domba, Serigala, Wortol2)),
    Orang1 \= Orang2, Wortol1 \= Wortol2.

reachable(S, _,[], S).
reachable(S, Visited, [Step|Steps], G) :-
    step(S, Step, Tmp), not(member(Tmp, Visited)),
    reachable(Tmp, [Tmp|Visited], Steps, G).

start((kiri,kiri,kiri,kiri)).
goal((kanan,kanan,kanan,kanan)).

solve(Steps) :- start(S), goal(G), reachable(S, [], Steps, G).
