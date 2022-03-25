OBJS	= obj/VisitantePrecio.o obj/Tarjeta.o obj/Equipo.o obj/Disco.o obj/VisitantePrecioDetalle.o obj/ComponenteEquipo.o obj/Bus.o obj/VisitanteEquipo.o obj/ClienteMain.o
OUT	= ejecutar
CC	 = g++
LFLAGS	 = 
FLAGS	 = -c -g -Wall -I./include

all: $(OBJS)
	$(CC) -g $(OBJS) -o $(OUT) $(LFLAGS) 

obj/ClienteMain.o:  
	$(CC) -o obj/ClienteMain.o $(FLAGS) src/ClienteMain.cpp -std=c++11

obj/Bus.o: 
	$(CC) -o obj/Bus.o $(FLAGS) src/Bus.cpp -std=c++11

obj/Tarjeta.o: 
	$(CC) -o obj/Tarjeta.o $(FLAGS) src/Tarjeta.cpp -std=c++11

obj/Equipo.o:
	$(CC) -o obj/Equipo.o $(FLAGS) src/Equipo.cpp -std=c++11

obj/Disco.o: 
	$(CC) -o obj/Disco.o $(FLAGS) src/Disco.cpp -std=c++11

obj/ComponenteEquipo.o:  
	$(CC) -o obj/ComponenteEquipo.o $(FLAGS) src/ComponenteEquipo.cpp  -std=c++11

obj/VisitanteEquipo.o:
	$(CC) -o obj/VisitanteEquipo.o $(FLAGS) src/VisitanteEquipo.cpp -std=c++11

obj/VisitantePrecio.o: 
	$(CC) -o obj/VisitantePrecio.o $(FLAGS) src/VisitantePrecio.cpp   -std=c++11

obj/VisitantePrecioDetalle.o:  
	$(CC) -o obj/VisitantePrecioDetalle.o $(FLAGS) src/VisitantePrecioDetalle.cpp  -std=c++11






clean:
	rm ./obj/*.o
