#!/usr/bin/env perl

use v5.20.0;

use utf8;
use strict;
use warnings;
use open ':std', ':encoding(UTF-8)';
use feature qw/say switch unicode_strings/;

use lib 'lib';
use Tor::ControlPort::ChangeIp;

my $tcp = Tor::ControlPort::ChangeIp->new;

unless ($tcp->auth('111222333()')) {
	say '[!] '."Can't auth!";
	exit;
}
say '[i] Auth OK';

while (1) {
	if ($tcp->ChangeIp) {
		say '[i] IP chenged!';
	} else {
		say '[!] IP not chenged!';
	}

	say 'Sleep 10 seconds...';
	sleep(10);
}