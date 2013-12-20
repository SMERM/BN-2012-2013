//
//  lex02_struct01.c
//  
//
//  Created by Giuseppe Silvi on 20/12/13.
//
//

#include <stdio.h>

// definizione di una nota
struct Nota
{
    // char nome[5] dava errore: array type
    char*nome; // puntatore a caratteri
    int ottava;
    char*dinamica;
};

main()
{
    struct Nota nota;
    nota.nome = "do";
    nota.ottava = 3;
    nota.dinamica= "sfz";
    
    printf ("%s%d (%s)\n", nota.nome, nota.ottava, nota.dinamica);
}