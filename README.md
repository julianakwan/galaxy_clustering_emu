# A model for the non-linear galaxy clustering 2-point statistics 

Welcome to our HOD P(k) emulator! Please see our <a
href=https://ui.adsabs.harvard.edu/abs/2015ApJ...810...35K/abstract>
paper </a> for further details. If you do use our emulator, please
cite our paper. Any questions can be sent to julianakwan123@gmail.com

You will need a version of GSL installed, which you can
download from <a href=http://www.gnu.org/software/gsl/ > here </a>. 
Any version that includes the gsl_matrix and gsl_spline functions will do.

I have included a sample Makefile - you will
need to edit the variables GSL_LIB and GSL_INCL to point to your own
directories first - just type 'make' in a terminal.  


The entire emulation process is contained in emu.c and main.c is just
a driver that opens the parameter file, checks that the HOD parameters
entered by the user is within the range of the code and writes the
output file. If you want to run a batch job, just swap out main.c with
your own driver, but be sure to include the same header files. Or you
can just incorporate the function emu(double *cosmoparams, double
outputredshift, double *output) into your code, but you need to
declare an array of 2025 doubles to hold the output. Note that emu
outputs in terms of Delta(k) = log10(k^1.5 P(k)/(4 pi^2)). This is
converted to P(k) in main.c, but if you only use emu.c, please keep
this in mind.

The k bins are defined in logk.h. The code assumes that the ordering
of parameters in *cosmoparams is the same as in the params.ini file.

To run the emulator, type: 
emu.out params.ini output.txt

params.ini should specify the HOD parameters (using the Zheng et al. 2005
model), in the following order:

- log10(Mcut) in the range [12.9 -- 14.0]
- log10(M1) in the range [13.5 -- 15.0]
- sigma in the range [0.5 -- 1.2]
- kappa in the range [0.5 -- 1.5]
- alpha in the range [0.5 -- 1.5]
- z     in the range [0. -- 1.0]
- output format [for P(k) use 1, for xi(r) use 2]


Please write only one parameter per line. You can comment out a line
by prefacing it with the '#' character. The resultant 2-pt function
will be contained in output.txt. There will also be a short header
reminding you of your input parameters. 

If you get it wrong, the code will helpfully remind you of the
parameter ranges again.

