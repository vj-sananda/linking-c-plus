rm -rf lib 
mkdir lib

#Library object files
g++ -c sub.cpp
g++ -c add.cpp

#Create static library
ar -rs ./lib/libaddsub.a add.o sub.o

#Create main executable
#Need -lstdc++
#Static linking
g++ main.cpp  -o main.exe  -L ./lib -laddsub 

./main.exe 

