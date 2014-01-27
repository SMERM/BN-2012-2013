//
//  lex02.c
//  
//
//  Created by Giuseppe Silvi on 20/12/13.
//
//

#include <stdio.h>

main()
{
    printf ("*************************************\n");
    printf ("ciao stronzi!\n");
    printf ("le strutture dati:\n");
    printf ("// DEFINIZIONE:\n")
    printf ("// ANAGRAFE:\n")
    printf ("struct Persona\n");
    printf ("{\n");
    printf ("char nome[20];\n");
    printf ("char cognome[20];\n");
    printf ("int giorno, mese anno;\n");
    printf ("};\n");
    printf ("* * * *\n");
    printf ("// DICHIARAZIONE:\n")
    printf ("struct Persona anagrafica[100];");
    printf ("anagrafica[0].nome = "100";\n");
    printf ("* * * *\n");
    printf ("// PUNTATORI:\n")
    printf ("int ottava = 3; // inizializzazione della variabile ottava\n");
    printf ("int*p = &ottava; // allocazione della memoria della variabile ottava\n");
    printf ("// p è un indirizzo\n");
    printf ("// *p è il dato - dereferenzia\n");
    printf ("// int**p è l'indirizzo dell'indirizzo\n");
}