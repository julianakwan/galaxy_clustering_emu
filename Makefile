GSL_INCL=/usr/local/include
GSL_LIB=/usr/local/lib


emu.out: emu.c main.c pade.c pk_to_xi.c emu.h
	gcc -o emu.out -I${GSL_INCL} -L${GSL_LIB} -lgsl -lgslcblas -lm -g main.c emu.c pade.c pk_to_xi.c
