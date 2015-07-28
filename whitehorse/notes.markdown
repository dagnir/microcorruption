Whitehorse
---

*  HSM-2 module
   - has ability to trigger deadbolt on its own
   - means lock has not `unlock` procedure

*  `login` procedure again has a stack buffer overflow vulnerability
   - sets up 16-byte buffer, but passes 0x30 for size to `getsn`

We use the buffer and the overflow vulnerability to inject some shellcode

since lock doesn't have any `unlock` procedure, we inject our own.

According to the manual, to open the deadbolt, we invoke the interrupt vector `0x7F`, Therefore inject the assembled version of the following

{% highlight asm %}
push 0x7f
call #4542
{% endhighlight %}

`#4532` is the `INT` procedure, that actually triggers the interrupt.

The assembled version, taking care of endianness, is `30127f00b01232450000000000000000b432`.

At the beginning, we have 16 bytes of spaces, which is enough for our shellcode since it's only 8 bytes long.

Like in the previous buffer overflow attack, we have to write past the end of the buffer, and overwrite the return address of `login`.  In this case, the address we want it to jump to is the start of the buffer.

That's it; after jump, it executes the shellcode, triggering the open deadbolt interrupt, and giving us access.

### input: `30127f00b01232450000000000000000b432`
