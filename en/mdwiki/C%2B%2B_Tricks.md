# C%2B%2B_Tricks
## X-Macro enums
The X-Macro preprocessor technique consists of defining a macro as a list of usages of another macro with varying arguments.  This macro can be defined and redefined immediately before use of the list macro, such that the elements of this list may be reused.  The technique can be used, for example, to define an enum complete with prefix to avoid conflicts and a string conversion function:
```
#define PREFIX STATUS
#define NAMES \
  E(Started) \
  E(Waiting) \
  E(Done) \
  E(Failure)

// Everything which follows is generic and may be reused for any enums defined with the pattern above

#define CAT_(a,b) a ## b
#define CAT(a,b) CAT_(a,b)

enum CAT(PREFIX,_t) {
#define E(name) CAT(PREFIX,_##name),
NAMES
#undef E
};

const char * CAT(PREFIX,_str) (enum CAT(PREFIX,_t) e) {
  switch (e) {
#define E(name) case( CAT(PREFIX,_##name) ): return #name ; break;
NAMES
#undef E
  }
  return NULL;
}

// Clean up when done
#undef CAT
#undef CAT_

#undef PREFIX
#undef NAMES
```

```
#include <stdio.h>
int main (int argc, char * *argv) {
  enum STATUS_t status;
  status = STATUS_Done;
  printf("%s\n", STATUS_str(status));
  printf("%s\n", STATUS_str(STATUS_Failure));
  return 0;
}
```
Note that hard-coding the prefix makes this much simpler, and is probably appropriate for most applications:
```
#define NAMES \
  E(Started) \
  E(Waiting) \
  E(Done) \
  E(Failure)

enum Status_t {
#define E(name) STATUS_##name,
NAMES
#undef E
};

const char * Status_str (enum Status_t e) {
  switch (e) {
#define E(name) case( STATUS_##name ): return #name ; break;
NAMES
#undef E
  }
  return NULL;
}

// Clean up when done
#undef NAMES
```
```
int main (int argc, char * *argv) {
  enum Status_t status;
  status = STATUS_Done;
  printf("%s\n", Status_str(status));
  printf("%s\n", Status_str(STATUS_Failure));
  return 0;
}
```

## printf-like functions
GCC and other compilers support checking agreement between a format string and variadic arguments.  This allows another function to wrap the *printf or *scanf functions while maintaining type safety.
See "format" at https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html for proper documentation.  Example:
```
// Prints formatted arguments after specified indent
__attribute__((format (printf, 3, 4)))
int fprintindf(FILE *output, int indent, const char *format, ...) {
  int size = fprintf(output, "%*s", 2*indent, "");
    // prints (indent) pairs of spaces
  va_list args;
  va_start(args, format);
  size += vfprintf(output, format, args);
    // prints the formatted arguments
  va_end(args);
  return size;
}

 ... */
  fprintindf(stderr, 3, "%d\n", 20); // prints "      20"
  fprintindf(stderr, 3, "%d\n", 20.); // compilation error with -Wall -Werror
 /* ...
```

## Intercepting function calls to shared libraries
This hack uses the run-time linker to intercept interactions between a program and a C or C++ library.  This can be useful when the library is closed-source or otherwise impractical to modify, or if a particular build of the library must be interacted with.
The following demonstrates applying this technique to a useless C++ library:
libfoo.hh
```
class Foo {
 public:
  Foo(int a);
  int start(int b);
 private:
  int value;
};
```
libfoo.cc ( Here for completeness of demonstration, but the interception itself works even if the implementation source cannot be obtained )
```
#include "libfoo.hh"
Foo::Foo(int a) {
  value = a;
}
int Foo::start(int b) {
  return value + b;
}
```
```
c++ -o libfoo.so libfoo.cc -shared -fPIC
export LD_LIBRARY_PATH=. # simulates installation of the library
```
useslibfoo.cc
```
#include <libfoo.hh>
#include <stdio.h>
int main (int argc, char * *argv) {
  Foo *foo = new Foo(4);
  printf("main: foo->start returns %d\n", foo->start(5));
  delete foo;
  return 0;
}
```
```
c++ -o useslibfoo useslibfoo.cc -I. -L. -lfoo
./useslibfoo
```
Prints
```
main: foo->start returns 9
```
Find mangled C++ names: (This step is not necessary for C, which does not mangle function names)
```
nm -g libfoo.so
```

...
```
000000000000070c T _ZN3Foo5startEi
00000000000006f6 T _ZN3FooC1Ei
```
...

intercept.cc
```
#include <libfoo.hh>
#include <dlfcn.h>
const char *foo_ctor_mangled = "_ZN3FooC1Ei";
const char *foo_start_mangled = "_ZN3Foo5startEi";
void (Foo::*foo_ctor)(int arg);
int (Foo::*foo_start)(int arg);
void *libfoo;
__attribute__((constructor))
static void initialize() {
  libfoo = dlopen("libfoo.so", RTLD_LAZY);
  *(void* *)&foo_ctor = dlsym(libfoo, foo_ctor_mangled);
  *(void* *)&foo_start = dlsym(libfoo, foo_start_mangled);
}
#include <stdio.h>
Foo::Foo (int arg) {
  printf("Constructing a Foo with initializing argument %d\n", arg);
  (this->*foo_ctor)(arg);
  printf("  Finished constructing\n");
}
int Foo::start (int arg) {
  printf("Foo::start(%d)\n", arg);
  int retval = (this->*foo_start)(arg);
  printf("  Returns %d\n", retval);
  return retval;
}
```
```
c++ -o libfoointercept.so -I. -L. intercept.cc -shared -fPIC -ldl
LD_PRELOAD=libfoointercept.so ./useslibfoo
```
Now prints
```
Constructing a Foo with initializing argument 4
  Finished constructing
Foo::start(5)
  Returns 9
main: foo->start returns 9
```
Note that the intercepting functions could even change the behavior by modifying the arguments.
