% Bonhomme pendu
use_module(library(random)).


motAleatoire(MotADeviner):-
    random_select(MotADeviner,
[[m,i,l,l,e,t],
[m,e,n,t,h,e],
[s,a,p,o,t,e],
[e,r,a,b,l,e],
[a,n,a,n,a,s],
[a,c,a,c,i,a],
[b,a,m,b,o,u],
[j,a,s,m,i,n],
[p,a,p,a,y,e],
[c,a,c,t,u,s],
[o,r,i,g,a,n],
[a,u,b,i,e,r],
[b,a,o,b,a,b],
[s,u,r,e,a,u],
[f,e,v,i,e,r],
[l,o,t,i,e,r],
[k,o,c,h,i,a],
[o,i,g,n,o,n],
[p,e,r,s,i,l],
[q,u,i,n,o,a],
[t,r,e,f,l,e],
[a,v,o,i,n,e],
[d,a,h,l,i,a],
[i,b,e,r,i,s],
[i,s,o,e,t,e],
[e,t,h,u,s,e],
[c,r,o,c,u,s],
[c,o,s,m,o,s],
[b,r,y,o,n,e],
[a,z,o,l,l,a],
[a,z,a,l,e,e],
[a,r,n,i,c,a],
[a,r,a,l,i,a],
[a,d,o,n,i,s],
[u,l,l,u,c,o],
[t,u,l,i,p,e],
[t,o,m,a,t,e],
[t,r,o,l,l,e],
[v,i,o,r,n,e],
[t,a,m,i,e,r],
[t,a,g,e,t,e],
[s,e,s,a,m,e],
[r,o,s,e,a,u],
[p,y,r,o,l,e],
[p,i,c,r,i,s],
[o,x,a,l,i,s],
[n,i,e,l,l,e],
[m,a,n,i,o,c],
[l,o,t,i,e,r],
[l,u,z,u,l,e]],_).



jouer(T,Mode):-
    motAleatoire(MotADeviner),
    writeln(MotADeviner),
    tour(T,0,MotADeviner,Mode).

tour(0,_,_,_):-writeln("T'as perdu!"),!,fail.

tour(_,6,_,_):-
    write("Vous avez gagné!"),
    !,
    fail.

tour(T, NbTrouvees, Mot, Mode):-
    write('Devinez une lettre: '),
    essayerLettre(Mode,Lettre),
    writeln(Lettre),
    ajoutLettre(Lettre, Mot, NbTrouvees, NouveauNbTrouvees,T,NT),
    write("Vies: "),
    writeln(NT),
    tour(NT,NouveauNbTrouvees, Mot, Mode).

essayerLettre(Mode, Lettre):-
    Mode = ia,
    !,
    devinerLettreHeuristiquement(Lettre).

essayerLettre(_, Lettre):-
    read(Lettre).


ajoutLettre(L, Mot, NoLettre, NouveauNoLettre,T,T):-
   depiler(NoLettre, Mot, [R|Reste]),
   not(Reste = []),
   R = L,
   !,
   write("Bonne lettre!: "),
   writeln(R),
   NouveauNoLettre is NoLettre + 1.


ajoutLettre(L, Mot, NoLettre, NouveauNoLettre,T,NT):-
   depiler(NoLettre, Mot, [R|Reste]),
   not(Reste = []),
   !,
   not(R = L),
   NT is T - 1,
   write("Mauvaise lettre!: "),
   writeln(L),
   NouveauNoLettre is NoLettre.


ajoutLettre(_, Mot, NoLettre, _,T,T):-
   depiler(NoLettre, Mot, [_|Reste]),
   Reste = [],
   writeln("Vous avez gagné!"),
   !,
   fail.


depiler(0,Liste,Liste).

depiler(N,[_|Liste], Retour):-
    N > 0,
	!,
    N1 is N - 1,
    depiler(N1, Liste, Retour).

devinerLettreHeuristiquement(Lettre):-
    Lettre = a.


%trouverNombreMotsParLettre():-
