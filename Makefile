index:
	gcc -c CcomFortran.c biblioteca.c
	gfortran -c -lgfortran numeroVezesFortran.f95 
	gcc -o cfortran CcomFortran.o biblioteca.o
	./cfortran
