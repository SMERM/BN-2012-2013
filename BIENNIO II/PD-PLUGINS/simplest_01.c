/*
//  simplest_01.c
//  Created by Giuseppe Silvi on 10/01/14.
*/

#include <m_pd.h>

/* NULL e una costante di sistema che generalmente
punta a zero ovvero che non e valido */

static t_class *simplest_01_class = (t_class *) NULL;

typedef struct _simplest_01_
{
    t_object parent;        /* deve essere il primo, pefforza */
} t_simplest_01;

static void *simplest_01_constructor(void)
{
    t_simplest_01 *istanza = (t_simplest_01 *) pd_new(simplest_01_class);
    post("Bella, sono istanziata!");
    return istanza;
}

static void simplest_01_destructor(void)
{
    post("Addio, core!");
}

/* void tra le parentesi e equivalente alle parentesi
vuote e serve a specificare che non ci sono argomenti */

void simplest_01_setup (void)
{
    post("Ciao core! dalla funzione simplest_01");
	
    /* gensym e una funzione di pd che consente di
	verificare vi sia una sola copia di stringa ovvero
	ritorna l'unica copia che ha oppure la crea */
	
    simplest_01_class = class_new(gensym("simplest_01"),
		simplest_01_constructor, simplest_01_destructor,
		sizeof(t_simplest_01), CLASS_NOINLET, 0);

	post("Fatto! salutame a soreta");
}

/* struttura a call back, imposto le funzioni da chiamare in maniera asincrona */