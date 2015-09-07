#Novosibirsk
---

- `main` does not delegate to a login function
- `main` reserves 500 bytes of stack space
- buffer starts at address 420c
- Interestingly, we're asked for a username to authenticate, not a password
- uses the `HSM-2`; this one controls the deadbolt
- `getsn` used for user input, given a max length of 500; no opportunity to overflow buffer
- `printf` is used to echo username back to user; again the raw buffer used as format
- method `conditional_unlock_door` is called to pass the username to the HSM-2 via interrupt

# Plan of attack
---
Let's try overwrite the interrupt number `conditional_unlock_door` calls.  Right now it calls `0x7e` for HSM-2, let's try to change to `0x7f`, which triggers deadbolt.  Our only option of overwriting anything in memory is to use `printf`.  We can use `%n` flag to write in order to write something back to memory, and since we want to write the value `0x7f`, we need to to get `printf` to `0x7f` of 127 characters before it encounters the `%n` flag.  Our buffer will begin with the 2-byte address that we want the write to go to, and that will be location `0x44c8`, which is where the value `0x7e` currently is, and we want it to be `0x7f`.  That's two bytes, so 125 left.  We can fill it with pretty much anything except for `0` because `strcpy` will stop copying once it sees one.  Then finally the `%n` to tell `printf` to write the numbers of characters printed to a location in memory.  When `conditional_unlock_door` is subsequently called, it won't be interacting with the HSM at all, and instead just calling the "open deadbolt" interrupt.

winning input: c8446565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565656565256e
