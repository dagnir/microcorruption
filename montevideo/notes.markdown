# Montevideo
---
* uses HSM-2
* has a stack buffer oveflow vulnerability
* doesn't use `getsn` to fill buffer
  instead, it uses `getsn` to fill another buffer starting at `0x2400`, then copies the contents from there to the local buffer using `strcpy`.  `strcpy` stops copying as soon as it encounters a 0 byte.
* code uses `memset` to clear the buffer at `0x2400` after copying to local buffer.

* plan of attack:

Because of the use of `memset` in `login`, we can't force a jump to `0x2400`, we have to jump to the local buffer in `login`.  Also, because `strcpy` is used to copy the input from `0x2400` to the local buffer, we have to to create an instruction sequence that *doesn't* contain a null byte, otherwise `strcpy` will stop copying prematurely.  In concrete terms, we *can't* use the shellcode from *Whitehorse* because it contains a null in the middle of it; specifically resulting from the assembled output of `push #0x7f`.  So what do we do?  Well what if we have the constant `#0xff7f` instead?  Then the shellcode won't have a null in it.  However, we can't push this value onto the stack and call `INT` because it won't result in triggering the unlock mechanism.  We need a way to load the constant, then clear the high byte before pushing it.  Here's what we do:

{% highlight asm %}
mov #0xff7f, r5
mov.b r5, r5
push r5
call #454c
{% endhighlight %}

Luckily this sequence of instructions does not have a null in it.  Note what we do here: we move the constant #0xff7f to a `r5`.  Then we clear the high byte using `mov.b` to move the register to itself; now we have `#0x007f` in `r5`, and from here, we just push it, then call `INT`.

### input: `35407fff45450512b0124c4511111111ee43`
