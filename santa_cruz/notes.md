# Santa Cruz
---

- `strcpy`, `r14` is is source ptr, `r15` is destination ptr
- `getsn` `r14` is length, `15` is buffer ptr

- username copied to buffer starting at 43a2
- password copied to buffer string at 43b5

plan: use username input to overflow and overwrite the return address
use password input to set address 43c6 to 00

`main` reserves stack space, for some reason, not sure why.
