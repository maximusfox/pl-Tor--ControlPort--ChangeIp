#!/usr/bin/env perl

use 5.008008;
use strict;
use warnings;
 
use ExtUtils::MakeMaker;
 
WriteMakefile(
    NAME => 'Tor::ControlPort::ChangeIp',
    AUTHOR => 'MaximusFox <shok@cpan.org>',
    LICENSE => 'perl_5',
    VERSION_FROM => 'lib/Tor/ControlPort/ChangeIp.pm',
    PREREQ_PM => {
        'IO::Socket' => 0,
        'IO::Socket::INET' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 1.001003,
        'Test::Pod' => 1.48,
        'Test::Pod::Coverage' => 1.10,
    },
    META_MERGE => {
      requires => { perl => '5.008008' },
      resources => {
        homepage => 'https://github.com/maximusfox/pl-Tor--ControlPort--ChangeIp',
        license  => 'http://dev.perl.org/licenses/',
        repository => 'https://github.com/maximusfox/pl-Tor--ControlPort--ChangeIp',
        bugtracker => 'https://github.com/maximusfox/pl-Tor--ControlPort--ChangeIp/issues'
      },
    }
);