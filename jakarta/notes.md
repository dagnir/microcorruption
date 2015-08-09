# Jakarta
---

- requires username and password
- `main` reserves 1000 bytes of stack space before calling `login`
- `login` makes space for a 34-byte buffer to store username and pass

- checks on username and password
  -
    ```
	4600:	  7f90 2100      cmp.b	#0x21, r15
	4604:	  0628           jnc	#0x4612 <login+0xb2>
	```

  - at this point, `r15` contains the password/username length.
  - if either check doesn't pass, CPU shuts off
  - if both checks pass, `test_username_and_password_valid` called
  - `getsn` for username given max 255 bytes
  - `getsn` for password given remainder of buffer (>= 31 bytes...)
  - return address of `login` on stack at 0x4016


  - length is determined by the couting the number of bytes it sees before seeing a null
  - login stores the username and password right next to each other in the 34-byte buffer.
  - plan of attack - take advantage of integer overflow!
    - places to take advantage of integer overflow:
	  - calculation of how much data to get for password, after getting the username.
	  - `login` calculates how much data to get for password using the following:
	     ```
		 45c8:	  3e40 1f00      mov	#0x1f, r14
		 45cc:	  0e8b           sub	r11, r14
		 45ce:	  3ef0 ff01      and	#0x1ff, r14
         ```
		 `r11` contains the left of the username.  However, if construct input so that it's length is `0x20`, then `0x1f` - `0x20` is `0xFFFF` (negative 1)!  The last instruction AND the result with `0x1ff`, so we can actually trick the lock into getting an extra `0x1ff` bytes.
	  - last thing we need to take into consideration is how long the password should be. This bit of code adds the lengths of the username and password together, then does a `cmp.b` with `0x21`
	    ```
		45fe:	  0f5b           add	r11, r15
		4600:	  7f90 2100      cmp.b	#0x21, r15
		4604:	  0628           jnc	#0x4612 <login+0xb2>
		```
		`r11` here contains the length of the password.  If we make it so that the password is 224 bytes long, which is `0xE0`, then `0xE0` + `0x20` is `0x100`, and since `cmp.b` only looks at the low byte, it sees a zero so the `cmp.b` will not set the carry flag, and it will take the jump.
  - by the time we entered the 32 bytes for the username, there's only 2 bytes left in the buffer.  On the stack, above the buffer is `r11` which login pushed at the beginning (another 2 bytes), then finally there's the return address.  Since the password is appended to the username in the buffer, the 5th and 6th byte of the password will overwrite the return address, so we put the address of `unlock_door` there; the first 2 bytes take up the remaining space in the buffer, and the next two will overwrite the saved contents of `r11`.

### Winning input
username: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
password: aaaaaaaa4c44aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

Note: We can leave out the trailing NULL byte because the buffer that `getsn` writes into is initially all 00.
