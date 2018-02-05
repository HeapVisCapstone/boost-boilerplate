# Lifted from https://gist.github.com/fmela/9061043


SOURCES = $(wildcard *.cpp)
HEADERS = $(wildcard *.h)
 
OBJECTS = $(SOURCES:%.cpp=%.o)
PROGRAM = json-ex
 
CXX := g++
CXXFLAGS = -g -std=c++11 -Wall -pedantic

LIBS =
LDFLAGS = $(LIBS:%=-l%)
 
$(PROGRAM) : $(OBJECTS)
	$(CXX) $(LDFLAGS) -o $@ $<
 
%.o : %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c -o $@ $<
 
.PHONY : clean
clean :
	rm -f $(PROGRAM) $(OBJECTS)