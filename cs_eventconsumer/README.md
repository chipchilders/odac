# CsEventconsumer

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'cs_eventconsumer'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cs_eventconsumer

## Usage

Running the listener as a process daemon:

bundle exec bin/cs_events.rb start

Run this to get more options:

bundle exec bin/cs_events.rb

Which will show you this:

Usage: cs_events <command> <options> -- <application options>

* where <command> is one of:
  start         start an instance of the application
  stop          stop all instances of the application
  restart       stop all instances and restart them afterwards
  reload        send a SIGHUP to all instances of the application
  run           start the application and stay on top
  zap           set the application to a stopped state
  status        show status (PID) of application instances

* and where <options> may contain several of the following:

    -t, --ontop                      Stay on top (does not daemonize)
    -f, --force                      Force operation
    -n, --no_wait                    Do not wait for processes to stop

Common options:
    -h, --help                       Show this message
        --version                    Show version


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
