#! /usr/bin/make

# This generic Makefile works with any program that needs to be compiled.
# Please contact honghual@sfu.ca if there is any problem.
#
# Run 'make' in the current directory to compile and link the program.
# Run 'make clean_object' to clean up object files.
# Run 'make clean' to delete any compiled files.
# Originated in 2001 by Haris Teguh
# modified May-2012 by Honghua Li

# Including of non standard library files:
#    The header files can be found in INCLUDEDIR.
#    The library object files can be found in LIBDIR.
INCLUDEDIR=/usr/include/
LIBDIR=/usr/lib

# Add more source files here
SOURCE= tetris.cpp include/InitShader.cpp

# The compiler we are using
CC= g++

# The flags that will be used to compile the object file.
# Add '-g' on the following line to debug your program.
CFLAGS= -O3 -g -Wall -pedantic -DGL_GLEXT_PROTOTYPES

# The name of the final executable
EXECUTABLE=tetris

# The basic library we are using add the other libraries you want to link
# to your program here 

# Linux (default)
LDFLAGS = -lGL -lglut -lGLEW -lXext -lX11 -lm

# Add other library files in a different directory here:
INCLUDEFLAG= -I. -I$(INCLUDEDIR) -Iinclude/
LIBFLAG= -L$(LIBDIR)

# Don't touch this one if you don't know what you're doing 
OBJECT= $(SOURCE:.cpp=.o)

# Don't touch any of these either if you don't know what you're doing 
all: $(OBJECT) depend
	$(CC) $(CFLAGS) $(INCLUDEFLAG) $(LIBFLAG) $(OBJECT) -o $(EXECUTABLE) $(LDFLAGS) 

depend:
	$(CC) -M $(SOURCE) > depend

$(OBJECT):
	$(CC) $(CFLAGS) $(INCLUDEFLAG) -c -o $@ $(@:.o=.cpp)

clean_object:
	rm -f $(OBJECT)

clean:
	rm -f $(OBJECT) depend $(EXECUTABLE)

tetris:
	make

include depend
