/*
//  nop_tilde_0.c
//  Created by Giuseppe Silvi on 10/01/14.
*/

#include <m_pd.h>

static t_class *nop_tilde_0_class = (t_class *) NULL;

typedef struct _nop_tilde_0_
{
    t_object parent;        /* deve essere il primo, pefforza */
	t_sample f;
} t_nop_tilde_0;

static void *nop_tilde_0_constructor()
{
    t_nop_tilde_0 *istanza = (t_nop_tilde_0 *) pd_new(nop_tilde_0_class);

    outlet_new((t_object *)istanza, &s_signal);
    return istanza;
}

static t_int *nop_tilde_0_perform(t_int *w)
{
	t_float *in = (t_float *) (w[2]);
	t_float *out = (t_float *) (w[3]);
	int n = (int) (w[4]);
	
	while (n--) *out++ = *in++; 
	
	return (w+5);
}

void nop_tilde_0_dsp(t_nop_tilde_0 *x, t_signal **sp)
{
	dsp_add(nop_tilde_0_perform, 4, x, sp[0]->s_vec, 
		sp[1]->s_vec, sp[0]->s_n);
}

void nop_tilde_0_setup (void)
{
    nop_tilde_0_class = class_new(gensym("nop0~"),
		(t_newmethod) nop_tilde_0_constructor, (t_method) NULL,
		sizeof(t_nop_tilde_0), CLASS_DEFAULT, 0);

	class_addmethod(nop_tilde_0_class,
	(t_method)nop_tilde_0_dsp, gensym("dsp"), 0);
	
	CLASS_MAINSIGNALIN(nop_tilde_0_class, t_nop_tilde_0, f);
   
	post("nop_tilde_0 loaded");
}