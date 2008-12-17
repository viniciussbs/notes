Erlang
======

Erlang is a functional language where the concurrency is tied to the language itself, and not to the operating system. The language uses message exchanging to interact with parallel processes without creating locks or synchronization methods. A simple Erlang program can create thousands to millions of lightweight processes that can be executed on single or multi-core processors, and even on a network of processors.

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

