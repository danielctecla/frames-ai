
%REGLAS DE INFERENCIA
subc(C1,C2):- frame(C1,subclase_de(C2),_,_).
subc(C1,C2):- frame(C1,subclase_de(C3),_,_),subc(C3,C2).
subclase(X):-frame(X,subclase_de(_),_,_).

%Para consultar propiedades use: propiedadesc(luciernaga, L).
propiedadesc(top,[]):-!.
propiedadesc(X,Z):-
	frame(X,subclase_de(Y),propiedades(P),descripcion(_)),
	propiedadesc(Y,P1), 
	concatenar(P1,P,W),
	de_reversa(W,Z).


%Para consultar todas las clases representadas en los frames
clases(L):-findall(X,frame(X,subclase_de(_),propiedades(_),descripcion(_)),L).

%Para consultar todas las subclases de una una clase
subclases_de(X,L):-findall(C1,subc(C1,X),L).

%Para consultar todas las superclases de una clase
superclases_de(X,L):-findall(C1,subc(X,C1),S),de_reversa(S,L).

%Para consultar que objetos tienen UNA propiedad determinada
tiene_propiedad_sub(P,Objs):-frame(X,_,propiedades(L),descripcion(_)),member(P,L),subclases_de(X,S),select(X,Objs,S),!.

%Obtiene todas las propiedades de todos los objetos
todas_propiedades(L):-
	findall(P,frame(_,_,propiedades(P),descripcion(_)),NL), 
	flatten(NL,FlatList),
	eliminar_duplicados(FlatList, L).


% Predicado auxiliar para eliminar duplicados de una lista
eliminar_duplicados([], []).
eliminar_duplicados([H|T], R) :-
    member(H, T), !,
    eliminar_duplicados(T, R).
eliminar_duplicados([H|T], [H|R]) :-
    eliminar_duplicados(T, R).	

% Para consultar todos los frames que tienen una propiedad en común
frames_con_propiedad(P, Frames):- findall(F, tiene_propiedad(P, F), Frames).
% Un frame tiene una propiedad si la propiedad está en la lista de propiedades del frame
tiene_propiedad(P, F) :- frame(F, _, propiedades(Propiedades), _), member(P, Propiedades).

%Obtiene la descripcion de un clase
obtiene_descripcion(C,D):-frame(C,_,_,descripcion(D)).

% Obtiene una lista de clases con los objetos que tienen la propiedades
% de la lista de entrada en P
consulta_por_propiedades(P,C):-consulta(P,C1),list_to_set(C1,C2),sort(C2,C).

consulta([],[]).
consulta([H|T],C):-consulta(T,C1), tiene_propiedad(H,C2),append(C1,C2,C).

%Es hoja (regresa verdadero si la clase no tiene subclases)
%
es_hoja(Clase):-subclases_de(Clase,L),L = [].


%Unir dos listas en una tercera
concatenar([],L,L).
concatenar([X|L1],L2,[X|L3]):-concatenar(L1,L2,L3).

% Agregar un elemento al final de una lista
% ?- agregar_final([a,b],c,L).
agregar_final([],E,[E]).
agregar_final([C|R],E,[C|RL]) :- agregar_final(R,E,RL).

%  Invertir una lista
%  ?-de_reversa([1,2,3],L).
de_reversa([X],[X]).
de_reversa([C|R],L) :- de_reversa(R,RI), agregar_final(RI,C,L).
