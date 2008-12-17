Erlang
======

*This notes were taken from the book [Programming Erlang, Software for a concurrent world](http://www.pragprog.com/titles/jaerlang/programming-erlang),
by Joe Armstrong, I'm currently reading.*

Erlang is a functional language where the concurrency is tied to the language itself, and not to the operating system.
The language uses message exchanging to interact with parallel processes without creating locks or synchronization methods.
A simple Erlang program can create thousands to millions of lightweight processes that can be executed on single or multi-core processors,
and even on a network of processors.

Erlang is about:

* Concurrency
* Distribution
* Fault tolerance
* Function programming
* Speeding up application on multi-core CPUs

Installing (Mac OS X)
---------------------

Make sure you have XCode installed. Download the most recent source from <http://www.erlang.org/download.html>.

	wget -c http://www.erlang.org/download/otp_src_R12B-5.tar.gz
	tar -xzf otp_src_R12B-5.tar.gz
	cd opt_src_R12B-5
	./configure --prefix=/usr/local
	make
	sudo make install

Starting the shell
------------------

Codes can be typed right into the *shell*; to start it, just execute the command `erl`.

	$ erl 
	Erlang (BEAM) emulator version 5.5.1 [source] [async-threads:0] [hipe] 
	Eshell V5.5.1 (abort with ^G)

Only expressions can be executed; you can't type things started by hyphens (such as `-module` or `-export`).

### About shell

The Erlang shell has a built-in line editor.

	Command					Description
	--------------------------------------------------------
	Ctrl+A                  Beginning of line
	Ctrl+E                  End of line
	Ctrl+F or right arrow   Forward character
	Ctrl+B or left arrow    Backward character
	Ctrl+P or up arrow      Previous line
	Ctrl+N or down arrow    Next line
	Ctrl+T                  Switch last two characters
	Tab                     Expand module or function name

When isn't responding, type `Ctrl+G`; you can then type some commands. Type `h` to view the available options.
	
	$ erl
	Erlang (BEAM) emulator version 5.6.5 [source] [smp:2] [async-threads:0] [kernel-poll:false]

	Eshell V5.6.5  (abort with ^G)
	1>
	^G
	User switch command
	 --> h
	  c [nn]            - connect to job
	  i [nn]            - interrupt job
	  k [nn]            - kill job
	  j                 - list all jobs
	  s [shell]         - start local shell
	  r [node [shell]]  - start remote shell
	  q        			- quit erlang
	  ? | h             - this message
	
Simple expressions
------------------

	1> 1 + 1.
	2
	2> (3 + 2) * 4.
	20

**Note:** The dialog starts with `>1`; this means that a new Erlang shell has been started. When an expression has been finished, the
dialog will be increased (like `2>` and so on).

Calculation with large numbers:

	3> 1234567890 * 987654321 * 9192939495969798.
	11209193004028605797078206136056620

Integers using base 16 and base 32 notation:

	4> 16#cafe * 32#sugar.
	1577682511434

Variables
---------

Variables must start with an uppercase letter.

	1> X = 1.
	1
	2> Name = "Nando Vieira".
	"Nando Vieira"
	
Erlang has *single assignment variables*; this means that you can set the value once, changing from being *unbound* to *having a value*.

	1> X = 1.
	1
	2> X = 2.
	** exception error: no match of right hand side value 2

The `=` sign is a *pattern matching* operator, which behaves like assignment when you have an unbound variable.

The *scope* of a variable is the place where it was set. If `X` is used inside a function, then this function is its scope. If `X` occurs
in different function, the all the values of `X` are different.

### Pattern Matching

In Erlang, `=` denotes a *pattern matching*; `Lhs = Rhs` means: evaluate the right side (`Rhs`) and then match the result against
the pattern on the left side (`Lhs`).

A variable, such as `X`, is a simple form of pattern. The first time a variable is assigned, as in `X = SomeExpression`, Erlang binds
`X` to the value of `SomeExpression`, so the statement becomes valid. The expression `X = AnotherExpression` will succeed only if
`SomeExpression` and `AnotherExpression` are identical.

	1> X = (2+4).
	6
	2> Y = 10.
	10
	3> X = 6.
	6
	4> X = Y.
	** exception error: no match of right hand side value 10
	5> Y = 10.
	10
	6> Y = 4.
	** exception error: no match of right hand side value 4
	7> Y = X.
	** exception error: no match of right hand side value 6
	
The expression `2+4` was assigned to `X`, and the answer was `6`. Then `10` was assigned to `Y`. When we try to evaluate `X = Y`, 
the match fails and then error message is printed.

Floating-Point Numbers
----------------------

	1> 5/3.
	1.6666666666666667
	2> 5 div 2.
	2
	3> 5 rem 3.
	2
	4> 4/2.
	2.0
	5> Pi = 3.14159.
	3.14159
	6> R = 5.
	5
	7> Pi * R * R.
	78.53975

On Erlang, the operator `/` always returns a float. Floating-point numbers must have a decimal point followed by at least one digit. The
expressions `N div M` and `N rem M` are used for integer division and remainder.

Atoms
-----

Atoms are constants that represents non-numerical values like `true`, `false`, `ok` and `error`; they're similar to Ruby's symbols.