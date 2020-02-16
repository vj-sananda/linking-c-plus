===================================================================
Dynamically loaded library

Executable is built with a link the dynamic library.
Have to tell the OS where to find this library.

Procedure differs between Linux and MAC OS X.
See below.

If the dynamic library cannot be found, the executable will not run.
As opposed to a library that is statically linked (i,e made part
of the executable)

On Windows, static libraries have a .lib extension, while
dynamic libraries have .dll extension. Just info. No windows 
example here.

===================================================================

On Linux

The shared library path must be placed in a file in /etc/ld.so.conf.d
then
sudo ldconfig to rebuild the cache
check if the shared library can be found with
ldconfig -p | grep <libname>

Alternatively, 
export LD_LIBRARY_PATH with the new directory
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/path_to_new_shared_so

===================================================================

On MAC OS X

If you rename lib to something else
the executable will fail with:

dyld: Library not loaded: ./lib/libaddsub.so
  Referenced from: /Users/vsananda/projects/linking-c++/dynamic/./main.exe
    Reason: image not found
    Abort trap: 6

This is because when the shared library is created the path is hardcoded
inside.

On MAC OS there is no ldconfig.

Setting DYLD_LIBRARY_PATH doesn't make a difference in finding the
dynamic shared library

===================================================================

Looks like the extension of .so or .dylib makes no difference for
Linux or MAC OS X