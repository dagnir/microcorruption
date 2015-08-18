# Addis Ababa
---

- no login() function, authentication directly done in `main`
- `main` sets up 22 bytes of stack space
- `main` uses `printf` to display all strings
- `main` uses `test_password_valid` to validate the password; it writes the result to an address passed to it by main; the address is `0x407c`
- *key*: `main` doesn't use a format string. It uses `printf` to display the entered password back to the user, but gives the string buffer directly to `printf` instead of using `"%s"`; the password we enter is used as the format string.
-

### Plan of attack
---

This implementation of `printf` has both `%x` and `%n` conversion specifiers which is key to this attack.  We create a format string such that it begins with `0x7c 0x40`, which is the address that the lock will check and compare against `0`.  We want this value to be positive.  Next up in the format string is `%x`.  This makes `printf` read two bytes from the stack, interpret it as an unsigned int, and print it; this also causes it to move *up* the stack, to the argument to the next format specifier.  Finally, the format string we use ends with `%n`.  This format specifier interprets the next argument on the stack as a pointer, and stores the number of characters printed so far at that address.  At this point, because of the preceeding `%x`, the value that it will use is the format string itself (i.e. it will read from the buffer that `main` used to store our input)!  And since it starts with the address of value we want to be positive, we're done.

winning input: 7c402578256e

### Why %x is necessary
The use of `%x` is important.  A call to `printf` looks like this `printf(char *str, ...)`.  Arguments are pushed on to the stack from right to left.

A call like `printf("%x%n")` has the following values on the stack:

```
+----------------------+
| <stuff>              | (2)
+----------------------+
| <more stuff>         | (1) <-- printf will begin grabbing arguments here...
+----------------------+
| <fmt string address> |
+----------------------+
| return address       | <-- SP
+----------------------+
```

Because of the way varargs works in C, the rest of the arguments to `printf` will be read from the stack starting just above where the format string is.  `%x` will make `printf` read the first two bytes at <b>(1)</b>, the move up to <b>(2)</b>.  Then `%n` will cause printf to interpret whatever is at <b>(2)</b> as a pointer, and write the number of characters printed so far at that address, then move up.  By using enough `%x`'s we can cause `printf` to read as many values up the stack as we want; i.e. if we want the the 7th and 8th bytes up the stack to be used as the pointer, then we use `%x%x%x%n` (3 %x's) to first move 6 bytes up the stack.
