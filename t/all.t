#!/usr/bin/env perl

use Test::More qw( no_plan );
use IO::Socket;
use IO::Socket::INET;
use Data::Dumper;

use lib 'lib';
use_ok "Tor::ControlProtocol::ChangeIp";

# Create faik server
my $sockServer = IO::Socket::INET->new(
	Listen    => 1,
	LocalAddr => 'localhost',
	LocalPort => 9000,
	Proto     => 'tcp'
	);


# Check class methods
can_ok('Tor::ControlProtocol::ChangeIp', qw/ new connect auth ChangeIp _readFromNewLine /);

# Check constraction
my $tor;
eval { $tor = Tor::ControlProtocol::ChangeIp->new( host => 'localhost', port => 9000 ) };
if ($@) { fail($@) }

# Check object methods
isa_ok($tor, 'Tor::ControlProtocol::ChangeIp');
can_ok($tor, qw/ new connect auth ChangeIp _readFromNewLine /);


# Check connect
is($tor->{host}, 'localhost', 'Check object param $tor->{host} $tor->{host}="'.($tor->{host}||'UNDEF').'";');
is($tor->{port}, '9000', 'Check object param $tor->{port} $tor->{port}="'.($tor->{port}||'UNDEF').'";');

my $connectResult;
eval { $connectResult = $tor->connect };
if ($@) { fail($@) }

ok($connectResult, 'Check connection');
ok($tor->{socket}, 'Check object param $tor->{socket} $tor->{socket}="'.($tor->{socket}||'UNDEF').'";');
isa_ok($tor->{socket}, 'IO::Socket::INET');

# TODO:
# Protocol check

# Send answer
# $sockServer->send('250 OK'."\r\n");

# # Check auth without password
# my $authWithoutPassword;
# eval { $authWithoutPassword = $tor->auth };
# if ($@) { fail($@) }

# ok($authWithoutPassword, 'Check auth');
# like($authWithoutPassword, qr/^(\d+)\s(.+)$/, 'Auth without password');

