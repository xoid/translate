#!/usr/bin/perl

use strict;
my %dict;

open my $D , '<dict' or die 'cant open dict';
while (<$D>)
{
  chomp;
  my ($k, $v) = split /\t/;
  $dict{$k} = $v;
}

my $r = join '|', map quotemeta, sort keys %dict;
warn $r;
$r = qr/($r)/;
warn $r;

local $/ = undef;
my $str = <>;

$str =~ s/($r)/$dict{$1}/gem;

print $str;

