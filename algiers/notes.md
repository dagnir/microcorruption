# Algiers

## Notes
 - This type of lock is new; uses the Bluetooth chip for communication
 - authentication done w/ user + PIN
 - `main` calls `login`
 - `login` calls `malloc`; first time the lock uses the heap...
 - `login` allocates two separate 16-byte buffers for username and password
   - buffers are filled using `getsn` with size `0x30`
   - username stored at 0x240e
   - password stored at 0x2424
 - `login` doesn't actually seem to do anything with the username (see addr `0x4688`)
 - `malloc` memory blocks for username and password seem to be 22 bytes each, username starting at `0x2408`, followed by `0x241e`
    - means 6 bytes used for metadata
      - bytes 0,1 seem to be address of previous block
      - bytes 2,3 seem to be address of next block
      - bytes 4,5 ??? not sure, but probably flags
      struct {
          uint16_t *prev;
          uint16_t *next;
          uint16_t flags;
      }
    - after `free` of second buffer, the `flags` part goes from `0x2100` to `0xc21f`.  Guessing that somehow means "not in use"
