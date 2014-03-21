/*
//  fifo_0.c
//  Created by Giuseppe Silvi on 10/01/14.
*/

#include <m_pd.h>

#define DEFAULT_FIFO_SIZE (16)

/* NULL e una costante di sistema che generalmente
punta a zero ovvero che non e valido */

static t_class *fifo_0_class = (t_class *) NULL;

typedef struct _fifo_0_
{
    t_object parent;        /* deve essere il primo, pefforza */
    t_float *memoria;
    t_float *put;
    t_float *get;
    t_int size;
} t_fifo_0;

static void *fifo_0_constructor(t_symbol *s, t_int argc, t_atom argv[])
{
    t_fifo_0 *istanza = (t_fifo_0 *) pd_new(fifo_0_class);
    istanza -> size = DEFAULT_FIFO_SIZE;

    if (argc > 0) {
        istanza -> size = atom_getfloat (&argv [0]);
    }
    
    istanza -> memoria = getbytes (istanza -> size*sizeof(t_float));
    istanza -> put = istanza -> get = istanza -> memoria;
    
    outlet_new((t_object *)istanza, &s_float);
    return istanza;
}

static void fifo_0_destructor(t_fifo_0 *x)
{
    freebytes(x -> memoria, x -> size);
}


static void bump(t_fifo_0 *istanza, t_float **pointer)
{
post("prima %s: 0x%x, %s: 0x%x", "put", istanza -> put, "get", istanza -> get);
    ++(*pointer);
    if ((*pointer) > (istanza -> memoria + istanza -> size-1)) {
        (*pointer) = istanza -> memoria;
    }
post("dopo %s: 0x%x, %s: 0x%x", "put", istanza -> put, "get", istanza -> get);
}

static void bang_callback(t_fifo_0 *istanza)
{
    if (istanza -> get != istanza -> put) {
        bump (istanza, &(istanza -> get));
    }
    outlet_float(istanza -> parent.ob_outlet, *(istanza -> get));
}

static void float_callback(t_fifo_0 *istanza, t_floatarg f)
{
    bump (istanza, &(istanza -> put));
    *(istanza -> put) = f;
    if (istanza -> put == istanza -> get) {
        bump (istanza, &(istanza -> get));
    }
}

/* void tra le parentesi e equivalente alle parentesi
vuote e serve a specificare che non ci sono argomenti */

void fifo_0_setup (void)
{
    /* gensym e una funzione di pd che consente di
	verificare vi sia una sola copia di stringa ovvero
	ritorna l'unica copia che ha oppure la crea */
	
    fifo_0_class = class_new(gensym("fifo_0"),
		(t_newmethod) fifo_0_constructor, (t_method) fifo_0_destructor,
		sizeof(t_fifo_0), CLASS_DEFAULT, A_GIMME, 0);

    class_addfloat(fifo_0_class, float_callback);
    class_addbang(fifo_0_class, bang_callback);
    
	post("fifo_0 loaded");
}

/* struttura a call back, imposto le funzioni da chiamare in maniera asincrona */