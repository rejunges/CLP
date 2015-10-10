main: biblioteca.o main.o 
	gcc biblioteca.o main.o -o main
main.o: main.c biblioteca.h
	gcc -c main.c
biblioteca.o: biblioteca.c biblioteca.h
	gcc -c biblioteca.c
run:	./main
clean:
	./main
	rm *.o main
