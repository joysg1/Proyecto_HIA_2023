% Paises que participaron en la primera guerra mundial
i_guerra_pais(rusia).
i_guerra_pais(francia).
i_guerra_pais(estados_unidos).
i_guerra_pais(austria).
i_guerra_pais(hungria).
i_guerra_pais(turquia).
i_guerra_pais(reino_unido).
i_guerra_pais(italia).
i_guerra_pais(japon).
i_guerra_pais(alemania).
i_guerra_pais(china).

% Paises que participaron en la segunda guerra mundial
ii_guerra_pais(rusia).
ii_guerra_pais(francia).
ii_guerra_pais(estados_unidos).
ii_guerra_pais(polonia).
ii_guerra_pais(reino_unido).
ii_guerra_pais(alemania).
ii_guerra_pais(japon).
ii_guerra_pais(italia).
ii_guerra_pais(china).

% Determinar probabilidad de que un pais participe en la tercera guerra mundial
prob_tercera_guerra(P, Prob) :-
    (
        (i_y_ii_guerras(P) -> Prob is 50);
        (i_guerra_solo(P) -> Prob is 15);
        (ii_guerra_solo(P) -> Prob is 30);
        Prob is 5
    ),
    write('La probabilidad de que '), write(P), write(' participe en una tercera guerra mundial es del '), write(Prob), write('%.'), nl.

% Determinar si un pais participo en ambas guerras mundiales
i_y_ii_guerras(P) :- i_guerra_pais(P), ii_guerra_pais(P).

% Determinar si un pais participo en SOLO la primera guerra mundial
i_guerra_solo(P) :- i_guerra_pais(P), not(ii_guerra_pais(P)).

% Determinar si un pais participo SOLO en la segunda guerra mundial
ii_guerra_solo(P) :- ii_guerra_pais(P), not(i_guerra_pais(P)).

% Realizar preguntas y determinar la probabilidad
preguntas :-
    write('PARTICIPACION DE LOS PAISES EN LAS GUERRAS MUNDIALES: '), nl,
    write('Por favor ingrese el nombre de un pais o escriba "salir." para finalizar la ejecucion'), nl,
    read(P1),
    (
        (P1 \= 'salir' ->
            (
                (i_y_ii_guerras(P1) -> write(P1), write(' estuvo implicado en la I y II Guerra Mundial.'), nl);
                (i_guerra_solo(P1) -> write(P1), write(' estuvo implicado solamente en la I Guerra Mundial.'), nl);
                (ii_guerra_solo(P1) -> write(P1), write(' estuvo implicado solamente en la II Guerra Mundial.'), nl);
                write(P1), write(' no estuvo implicado ni en la I ni en la II Guerra Mundial.'), nl
            ),
            prob_tercera_guerra(P1, Prob),
			nl,
            preguntas % Llamada recursiva para repetir el proceso
        );
        write('Programa finalizado, gracias por usarlo')
    ).

% Iniciar el programa
inicio :- preguntas.

% Ejecutar el programa
:- inicio.
