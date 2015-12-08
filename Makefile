#g++ main.cpp -pthread -I/usr/include/boost -I/home/xdna/tmp/socket.io-client-cpp/lib/rapidjson/include/rapidjson -I/home/xdna/tmp/socket.io-client-cpp/lib/websocketpp/websocketpp -L/usr/lib/x86_64-linux-gnu  -L/home/xdna/tmp/socket.io-client-cpp  -lsioclient  -lpthread  -lboost_system -std=c++11 

CXX=g++
CXXFLAGS=-I. -std=c++11 -pthread -lsioclient  -lpthread  -lboost_system
BOOSTINCLUDE=-I/usr/include/boost

RAPIDJSON=-Ilib/rapidjson/include/rapidjson
websocketpp=-Ilib/websocketpp/websocketpp

CXXLIB=-L. 
BOOSTLIBE=-L/usr/lib/x86_64-linux-gnu

#SRC=main.c hello.c 
SRCXX=main.cpp

#sets the variable OBJECTS to be the same as SOURCES
#OBJ=$(SRC:.c=.o)  
OBJ=$(SRCXX:.cpp=.o)      #OBJ=main.o hello.o

#output exec name	
EXECUTABLE=run

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJ)
	$(CXX) -o $@ $^ $(BOOSTINCLUDE) $(RAPIDJSON) $(websocketpp) $(CXXLIB) $(BOOSTLIBE) $(CXXFLAGS)

##For C++ #####################
%.o: %.cpp
	$(CXX) -c -o $@ $^ $(BOOSTINCLUDE) $(RAPIDJSON) $(websocketpp) $(CXXLIB) $(BOOSTLIBE) $(CXXFLAGS)

clean:
	rm *.o $(EXECUTABLE)

