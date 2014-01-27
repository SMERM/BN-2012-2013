//
//  lex02_funz01.c
//  
//
//  Created by Giuseppe Silvi on 20/12/13.
//
//

#include <stdio.h>

// dichiarazione di una funzione
int gino (int paolo)
{
    printf ("ciao, my names is gino %d\n", paolo);
}

main()
{
    int(*p)(int) = gino;
    (*p)(42);
}