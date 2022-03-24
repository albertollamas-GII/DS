OUT	= ejecutar.exe
CC	 = g++
LFLAGS	 =  -g -I./include -Wall
FLAGS	 = -c $(LFLAGS)

all: obj/ClienteMain.o
	$(CC) -o ejecutar.exe $(LFLAGS) obj/ClienteMain.o obj/ComponenteEquipo.o obj/VisitanteEquipo.o obj/Bus.o obj/VisitantePrecio.o obj/Tarjeta.o obj/Equipo.o obj/Disco.o obj/VisitantePrecioDetalle.o  -std=c++11

obj/ClienteMain.o:  obj/VisitantePrecio.o obj/Tarjeta.o obj/Equipo.o obj/Disco.o obj/VisitantePrecioDetalle.o obj/ComponenteEquipo.o obj/Bus.o
	$(CC) -o obj/ClienteMain.o $(FLAGS) src/ClienteMain.cpp obj/ComponenteEquipo.o obj/VisitanteEquipo.o obj/Bus.o obj/VisitantePrecio.o obj/Tarjeta.o obj/Equipo.o obj/Disco.o obj/VisitantePrecioDetalle.o  -std=c++11

obj/Bus.o: obj/ComponenteEquipo.o
	$(CC) -o obj/Bus.o $(FLAGS) src/Bus.cpp obj/ComponenteEquipo.o -std=c++11

obj/Tarjeta.o: obj/ComponenteEquipo.o 
	$(CC) -o obj/Tarjeta.o $(FLAGS) src/Tarjeta.cpp obj/ComponenteEquipo.o  -std=c++11

obj/Equipo.o: obj/ComponenteEquipo.o obj/Bus.o obj/Disco.o obj/Tarjeta.o
	$(CC) -o obj/Equipo.o $(FLAGS) src/Equipo.cpp obj/ComponenteEquipo.o  -std=c++11

obj/Disco.o: obj/ComponenteEquipo.o 
	$(CC) -o obj/Disco.o $(FLAGS) src/Disco.cpp obj/ComponenteEquipo.o  -std=c++11

obj/ComponenteEquipo.o:  
	$(CC) -o obj/ComponenteEquipo.o $(FLAGS) src/ComponenteEquipo.cpp  -std=c++11

obj/VisitanteEquipo.o:
	$(CC) -o obj/VisitanteEquipo.o $(FLAGS) src/VisitanteEquipo.cpp -std=c++11

obj/VisitantePrecio.o: obj/VisitanteEquipo.o 
	$(CC) -o obj/VisitantePrecio.o $(FLAGS) src/VisitantePrecio.cpp  obj/VisitanteEquipo.o -std=c++11

obj/VisitantePrecioDetalle.o:  obj/VisitanteEquipo.o 
	$(CC) -o obj/VisitantePrecioDetalle.o $(FLAGS) src/VisitantePrecioDetalle.cpp obj/VisitanteEquipo.o -std=c++11






clean:
	rm ./obj/*.o
