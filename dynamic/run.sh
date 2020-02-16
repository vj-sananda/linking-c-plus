
#Library object files
#compile with PIC flag (Position Independent Code)
#for dynamic library
g++ -c -fPIC sub.cpp
g++ -c -fPIC add.cpp

#Create dynamic library
#Looks like the extension of .so or .dylib makes no difference for
#Linux or MAC OS X
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

#On MAC OS X only
otool -L ./main.exe

#On Linux
ldconfig -p | grep addsub
