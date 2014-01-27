/*
//  lez03_struttpunt.c
//  
//
//  Created by Giuseppe Silvi on 10/01/14.
//
*/

#include <stdio.h>

struct Nota                     /* struttura dati */
{
    float freq, at, dur;
    int instr;
};

int main ()
{
    /*                   freq  at   dur  instr */
    struct Nota prima = {27.5, 0.0, 5.0, 1};
    struct Nota *n = &prima;
    
    printf("%f %f %f %d\n", prima.freq, prima.at, prima.dur, prima.instr);
    
    /* inizializzazione della variabile freq attraverso il puntatore n */
    (*n).freq = 42;
    printf("%f \n", prima.freq);
    
    /* come sopra mediante scrittura stenografata */
    n->freq = 48;
    printf("%f \n", prima.freq);
}