# CppNotes
### Compile time Initialization of Data Structures

In C we are used to doing things like this:

```
#!c
struct { int a, b; } map_a2b = { {1, 2}, {2, 4}, {4, 8}};
```

To initialize complex data structures.  However if you get clever and try to do it in C++
you get in trouble.  A very simple case works:

```
#!c++
class int_pair {
public:
  int a, b;
};
int_pair map_a2b[] = { {1, 2}, {2, 4}, {4, 8}};
```

However a seemingly trivial change breaks it:
```
#!c++
class int_pair {
public:
  int a, b;
};
int_pair map_a2b[] = { {1, 2}, {2, 4}, {4, 8}};
```

This is because only "aggregate" types may be initialized with lists.
What''s an *aggregate* you ask?  According to the C++ standard:

_'An aggregate is an array or a class (clause 9) with no user-declared constructors (12.1), no private or protected non-static data members (clause 11), no base classes (clause 10), and no virtual functions (10.3)._

The above is no longer an aggregate because it has a non-default constructor (sigh).

You might get clever and try to initialize something more complicated like a map:

```
#!c++
std::map<int,int> a[] = { {1, 2}, {2, 4}, {4, 8}};
```

This won''t work either, at least not in the current standard (C++98).
C++11, whose features are slowly being rolled out in gcc will support this.



