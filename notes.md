## Lua theory
### The __index metamethod
When access an absent field in a table, the interpreter look for an __index metamethod, when there isn't one, it returns null, otherwise, the metamethod provides the result.


