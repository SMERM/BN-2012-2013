/*
//  mem_0.c
//  Created by Giuseppe Silvi on 10/01/14.
*/

#include <m_pd.h>

/* NULL e una costante di sistema che generalmente
punta a zero ovvero che non e valido */

static t_class *mem_0_class = (t_class *) NULL;

typedef struct _mem_0_
{
    t_object parent;        /* deve essere il primo, pefforza */
    t_float memoria;
} t_mem_0;

static void *mem_0_constructor(void)
{
    t_mem_0 *istanza = (t_mem_0 *) pd_new(mem_0_class);
    outlet_new((t_object *)istanza, &s_float);
    return istanza;
}

static void float_callback(t_mem_0 *istanza, t_floatarg f)
{
    istanza -> memoria = f;
}

static void bang_callback(t_mem_0 *istanza)
{
    outlet_float(istanza -> parent.ob_outlet, istanza -> memoria);
}


/* void tra le parentesi e equivalente alle parentesi
vuote e serve a specificare che non ci sono argomenti */

void mem_0_setup (void)
{
    /* gensym e una funzione di pd che consente di
	verificare vi sia una sola copia di stringa ovvero
	ritorna l'unica copia che ha oppure la crea */
	
    mem_0_class = class_new(gensym("mem_0"),
		mem_0_constructor, (t_method)NULL,
		sizeof(t_mem_0), CLASS_DEFAULT, 0);

    class_addfloat(mem_0_class, float_callback);
    class_addbang(mem_0_class, bang_callback);
    
	post("mem_0 loaded");
}

/* struttura a call back, imposto le funzioni da chiamare in maniera asincrona */