%Bonhomme pendu


motGagnant(X):-member(X,["Chien"]).

jouer(0):-write("T'as perdu!"),!.

jouer(T):-
    write('Essayez un mot: '),
    read_line_to_string(user_input,Mot),
    not(motGagnant(Mot)),
    !,
    T1 is T - 1,
    write("Tentatives restante: "),
    writeln(T1),
    jouer(T1).

jouer(T):-
    T>0,
    write("Bravo!").
