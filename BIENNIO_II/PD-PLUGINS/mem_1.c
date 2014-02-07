/*
//  mem_1.c
//  Created by Giuseppe Silvi on 10/01/14.
*/

#include <m_pd.h>

/* NULL e una costante di sistema che generalmente
punta a zero ovvero che non e valido */

static t_class *mem_1_class = (t_class *) NULL;

typedef struct _mem_1_
{
    t_object parent;        /* deve essere il primo, pefforza */
    t_float memoria;
    t_int flag;
} t_mem_1;

static void *mem_1_constructor(void)
{
    t_mem_1 *istanza = (t_mem_1 *) pd_new(mem_1_class);
    istanza -> memoria = istanza -> flag = 0;
    outlet_new((t_object *)istanza, &s_float);
    return istanza;
}

static void _bang_callback(t_mem_1 *istanza)
{
    outlet_float(istanza -> parent.ob_outlet, istanza -> memoria);
}

static void bang_callback(t_mem_1 *istanza)
{
    _bang_callback(istanza);
    ++(istanza -> flag);
}

static void float_callback(t_mem_1 *istanza, t_floatarg f)
{
    if (istanza -> flag != 0)
        bang_callback(istanza);
    
    istanza -> memoria = f;
}

/* void tra le parentesi e equivalente alle parentesi
vuote e serve a specificare che non ci sono argomenti */

void mem_1_setup (void)
{
    /* gensym e una funzione di pd che consente di
	verificare vi sia una sola copia di stringa ovvero
	ritorna l'unica copia che ha oppure la crea */
	
    mem_1_class = class_new(gensym("mem_1"),
		mem_1_constructor, (t_method)NULL,
		sizeof(t_mem_1), CLASS_DEFAULT, 0);

    class_addfloat(mem_1_class, float_callback);
    class_addbang(mem_1_class, bang_callback);
    
	post("mem_1 loaded");
}

/* struttura a call back, imposto le funzioni da chiamare in maniera asincrona */