#!/usr/bin/perl -n -s

=head1 NAME

mkutf32list.pl

=head1 USAGE

mkutf32list.pl cid2code.txt > sp_jp_text.tex
mkutf32list.pl -style=utf cid2code.txt > sp_jp_utf.tex
mkutf32list.pl -style=kchar cid2code.txt > sp_jp_kchar.tex
mkutf32list.pl -style=list cid2code.txt > sp_list_j.txt
mkutf32list.pl -allrange cid2code.txt > sp_jp_text.tex

=head1 AUTHOR

Takuji Tanaka

=head1 NOTE

This software is a part of otfbeta-uptex (a.k.a. japanese-otf-uptex).

=cut

use strict;
use encoding 'utf8';
use feature 'switch';

our ($style, $allrange);
our (@count, %reset_ch, $icollec, $cid2code, $line);
our ($col_utf32, @out);
our (@cid_max, $collection_n, $collection, $utfmac, $cmap, $source);

BEGIN{
    $line = 0;
    @count = ();
    %reset_ch = ();
    $icollec = 0;
    @out = ();
}

if (/cid2code/) {
    chomp;
    s/^# /# in /;
    $cid2code=$_;
    $cid2code=~s/^#/%/;
}
if (/((Adobe.*)-\d) Character Collection/) {
    $collection_n=$1;
    $collection=$2;
    given($collection) {
	when (/cns/i) { @cid_max = qw/-1 14098 17407 17600 18845 18964 19087 19155/;
			$utfmac="UTFT"; $cmap="UniCNS-UTF32";
			$source="cmapresources_cns1-6/cid2code.txt"; }
	when (/gb/i)  { @cid_max = qw/-1 7716 9896 22126 22352 29063 30283/;
			$utfmac="UTFC"; $cmap="UniGB-UTF32";
			$source="cmapresources_gb1-5/cid2code.txt"; }
	when (/kor/i) { @cid_max = qw/-1 9332 18154 18351/;
			$utfmac="UTFK"; $cmap="UniKS-UTF32";
			$source="cmapresources_korea1-2/cid2code.txt"; }
	default       { @cid_max = qw/-1 8283 8358 8719 9353 15443 20316 23057/;
			$utfmac="UTF";  $cmap="UniJIS-UTF32";
			$source="cmapresources_japan1-6/cid2code.txt"; }
    }
}

next if (/^#/);
$line++;
if ($line == 1) {
    print <<END;
%
% This file is generated from the data of $cmap
$cid2code
% for $collection_n
%
% Reference:
%   https://github.com/adobe-type-tools/cmap-resources/
%   $source
%
% A newer CMap may be required for some code points.
%
END
}
if (/^CID/) {
    my @header = split;
    my $i=0;
    foreach (@header) {
	if (/^Uni(JIS|KS|CNS|GB)-UTF32$/) {
	    $col_utf32 = $i;
	    last;
	}
	$i++
    }
    next;
}

my @list = split;
my $cid = $list[0];
my @utf32 = split ',', $list[$col_utf32];

foreach (@utf32) {
    s/^0+//;

    next if ($_ eq '*');
    next if ($_ =~ '^[1-7][0-9a-f]$|^.$');
    next if ($_ =~ 'v');
    tr/a-z/A-Z/;
    my $ch=hex($_);
    next if ($ch < 0x10000 && !$allrange);

    while(!($cid_max[$icollec+1]>=$cid && $cid>$cid_max[$icollec])) {
	$icollec++;
	if ($icollec>@cid_max) {
	    die "CID:$cid (Character $_) is out of range!!\n";
	}
    }
    if ($count[$icollec]==0) {
	$reset_ch{$ch}=$icollec;
    }
    $count[$icollec]++;
    push @out, $ch;
}


END {
    my ($i, $out, $ch);

    foreach $ch (@out) {
	if (defined($reset_ch{$ch})) {
	    $i=0;
	    print "\n\n";
	    print "%" if ($style =~ /list/);
	    print "$collection-$reset_ch{$ch}";
	    print "\\\\" if ($style !~ 'list');
	    print "\n";
	}

	$i++;
	given($style) {
	    when (/utf/)   { $out=sprintf "\\${utfmac}{%X}", $ch; }
	    when (/kchar/) { $out=sprintf "\\kchar\"%X", $ch; }
	    when (/list/)  { $out=sprintf "%X", $ch; }
	    default        { $out=chr($ch); }
	}
	if ($i % 10 != 1) {
	    print "," if ($style =~ /list/);
	}
	print $out;
	my ($newline);
	$newline = $allrange ? 25 : 10;
	if ($i % $newline == 0) {
	    print "%" if ($style =~ /utf/);
	    print "\n" ;
	}
    }

    print "\n\n% end\n";
}
