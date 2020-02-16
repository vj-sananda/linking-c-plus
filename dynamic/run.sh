
#Library object files
#compile with PIC flag (Position Independent Code)
#for dynamic library
g++ -c -fPIC sub.cpp
g++ -c -fPIC add.cpp

#Create dynamic library
echo "g++ -shared -o ./lib/libaddsub.dylib add.o sub.o "
echo ""
g++ -shared -o ./lib/libaddsub.dylib add.o sub.o 

#Create main executable
echo " Create main 1 way"
g++ main.cpp  -o main.exe  -L ./lib -laddsub
./main.exe

#Also works
echo ""
echo " Create main 2nd way"
g++ main.cpp  -o main.exe  ./lib/libaddsub.dylib
./main.exe 

otool -L ./main.exe