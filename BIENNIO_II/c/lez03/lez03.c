//
//  lez03.c
//  
//
//  Created by Giuseppe Silvi on 10/01/14.
//
//

//#include <stdio.h>

// dichiarazione della struttura dati Nota
struct Nota
{
    float freq, at, dur;
    int instr;
};

// dichiarazione di una Nota
struct Nota La440 = {440, 0, 3, 1};

//La440.freq restituisce 440

struct Nota *n = &La440

//deferenziazione di n prima dentro le parentesi, diventa una struttura dati
(*n).freq
//scrittura stenografata
n->freq