#!/usr/bin/perl

=head1 NAME

mktfm_sp.pl

=head1 USAGE

script/mktfm_sp.pl

=head1 NOTE

This software is a part of otfbeta-uptex (a.k.a. japanese-otf-uptex).

=cut

use FindBin;
use lib "$FindBin::Bin";
use MakeSPList;

$multi=3;
@tex_tfm_h=(0x00, 0x0B, 0x00, 0x01, 0x00, 0x2B, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x0E, 0x54, 0x45, 0x58, 0x20, 0x4B, 0x41, 0x4E, 0x4A, 0x49, 0x20, 0x54, 0x45, 0x58, 0x54, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x4F, 0x54, 0x46, 0x20, 0x4B, 0x41, 0x4E, 0x4A, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x14, 0x7B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xEB, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x99, 0x9A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x33, 0x33, 0x00, 0x02, 0x00, 0x00);
@tex_tfm_v=(0x00, 0x09, 0x00, 0x01, 0x00, 0x2B, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x0E, 0x54, 0x45, 0x58, 0x20, 0x4B, 0x41, 0x4E, 0x4A, 0x49, 0x20, 0x54, 0x45, 0x58, 0x54, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x4F, 0x54, 0x46, 0x20, 0x4B, 0x41, 0x4E, 0x4A, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x99, 0x9A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x33, 0x33, 0x00, 0x02, 0x00, 0x00);
@dvips_tfm_h=(0x00, 0x0B, 0x00, 0x01, 0x00, 0x1B, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x14, 0x7B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xEB, 0x85, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
@dvips_tfm_v=(0x00, 0x09, 0x00, 0x01, 0x00, 0x1B, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);

# halfwidth characters U+FF61..FF9F are correspond to (0x6D5x, 0x6D6x, 0x6E3x, 0x6E4x) in subfont
@tex_tfm_sub_h=map{ hex($_) } qw/
	00 0b 00 40 00 6c 00 12 00 00 00 01 00 03 00 02
	00 02 00 01 00 00 00 00 00 00 00 09 00 00 00 00
	00 a0 00 00 0e 54 45 58 20 4b 41 4e 4a 49 20 54
	45 58 54 00 00 00 00 00 00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00 00 00 00 00 09 4f 54 46
	20 4b 41 4e 4a 49 00 00 00 00 00 00 00 00 00 00
	80 00 00 00 00 00 00 00 6d 51 00 01 6d 52 00 01
	6d 53 00 01 6d 54 00 01 6d 55 00 01 6d 56 00 01
	6d 57 00 01 6d 58 00 01 6d 59 00 01 6d 5a 00 01
	6d 5b 00 01 6d 5c 00 01 6d 5d 00 01 6d 5e 00 01
	6d 5f 00 01 6d 60 00 01 6d 61 00 01 6d 62 00 01
	6d 63 00 01 6d 64 00 01 6d 65 00 01 6d 66 00 01
	6d 67 00 01 6d 68 00 01 6d 69 00 01 6d 6a 00 01
	6d 6b 00 01 6d 6c 00 01 6d 6d 00 01 6d 6e 00 01
	6d 6f 00 01 6e 30 00 01 6e 31 00 01 6e 32 00 01
	6e 33 00 01 6e 34 00 01 6e 35 00 01 6e 36 00 01
	6e 37 00 01 6e 38 00 01 6e 39 00 01 6e 3a 00 01
	6e 3b 00 01 6e 3c 00 01 6e 3d 00 01 6e 3e 00 01
	6e 3f 00 01 6e 40 00 01 6e 41 00 01 6e 42 00 01
	6e 43 00 01 6e 44 00 01 6e 45 00 01 6e 46 00 01
	6e 47 00 01 6e 48 00 01 6e 49 00 01 6e 4a 00 01
	6e 4b 00 01 6e 4c 00 01 6e 4d 00 01 6e 4e 00 01
	6e 4f 00 01 02 11 00 00 01 11 00 00 00 00 00 00
	00 08 00 00 00 10 00 00 00 00 00 00 00 0e 14 7b
	00 00 00 00 00 01 eb 85 00 00 00 00 00 00 00 00
	00 00 00 00 00 01 99 9a 00 00 00 00 00 10 00 00
	00 10 00 00 00 04 00 00 00 03 33 33 00 02 00 00
/;
@tex_tfm_ucs_h=map{ hex($_) } qw/
	00 0b 00 40 00 6c 00 12 00 00 00 01 00 03 00 02
	00 02 00 01 00 00 00 00 00 00 00 09 00 00 00 00
	00 a0 00 00 0e 54 45 58 20 4b 41 4e 4a 49 20 54
	45 58 54 00 00 00 00 00 00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00 00 00 00 00 09 4f 54 46
	20 4b 41 4e 4a 49 00 00 00 00 00 00 00 00 00 00
	80 00 00 00 00 00 00 00 ff 61 00 01 ff 62 00 01
	ff 63 00 01 ff 64 00 01 ff 65 00 01 ff 66 00 01
	ff 67 00 01 ff 68 00 01 ff 69 00 01 ff 6a 00 01
	ff 6b 00 01 ff 6c 00 01 ff 6d 00 01 ff 6e 00 01
	ff 6f 00 01 ff 70 00 01 ff 71 00 01 ff 72 00 01
	ff 73 00 01 ff 74 00 01 ff 75 00 01 ff 76 00 01
	ff 77 00 01 ff 78 00 01 ff 79 00 01 ff 7a 00 01
	ff 7b 00 01 ff 7c 00 01 ff 7d 00 01 ff 7e 00 01
	ff 7f 00 01 ff 80 00 01 ff 81 00 01 ff 82 00 01
	ff 83 00 01 ff 84 00 01 ff 85 00 01 ff 86 00 01
	ff 87 00 01 ff 88 00 01 ff 89 00 01 ff 8a 00 01
	ff 8b 00 01 ff 8c 00 01 ff 8d 00 01 ff 8e 00 01
	ff 8f 00 01 ff 90 00 01 ff 91 00 01 ff 92 00 01
	ff 93 00 01 ff 94 00 01 ff 95 00 01 ff 96 00 01
	ff 97 00 01 ff 98 00 01 ff 99 00 01 ff 9a 00 01
	ff 9b 00 01 ff 9c 00 01 ff 9d 00 01 ff 9e 00 01
	ff 9f 00 01 02 11 00 00 01 11 00 00 00 00 00 00
	00 08 00 00 00 10 00 00 00 00 00 00 00 0e 14 7b
	00 00 00 00 00 01 eb 85 00 00 00 00 00 00 00 00
	00 00 00 00 00 01 99 9a 00 00 00 00 00 10 00 00
	00 10 00 00 00 04 00 00 00 03 33 33 00 02 00 00
/;
@dvips_tfm_ucs_h=map{ hex($_) } qw/
	00 0b 00 40 00 5c 00 02 00 00 00 01 00 03 00 02
	00 02 00 01 00 00 00 00 00 00 00 09 00 00 00 00
	00 a0 00 00 00 00 00 00 ff 61 00 01 ff 62 00 01
	ff 63 00 01 ff 64 00 01 ff 65 00 01 ff 66 00 01
	ff 67 00 01 ff 68 00 01 ff 69 00 01 ff 6a 00 01
	ff 6b 00 01 ff 6c 00 01 ff 6d 00 01 ff 6e 00 01
	ff 6f 00 01 ff 70 00 01 ff 71 00 01 ff 72 00 01
	ff 73 00 01 ff 74 00 01 ff 75 00 01 ff 76 00 01
	ff 77 00 01 ff 78 00 01 ff 79 00 01 ff 7a 00 01
	ff 7b 00 01 ff 7c 00 01 ff 7d 00 01 ff 7e 00 01
	ff 7f 00 01 ff 80 00 01 ff 81 00 01 ff 82 00 01
	ff 83 00 01 ff 84 00 01 ff 85 00 01 ff 86 00 01
	ff 87 00 01 ff 88 00 01 ff 89 00 01 ff 8a 00 01
	ff 8b 00 01 ff 8c 00 01 ff 8d 00 01 ff 8e 00 01
	ff 8f 00 01 ff 90 00 01 ff 91 00 01 ff 92 00 01
	ff 93 00 01 ff 94 00 01 ff 95 00 01 ff 96 00 01
	ff 97 00 01 ff 98 00 01 ff 99 00 01 ff 9a 00 01
	ff 9b 00 01 ff 9c 00 01 ff 9d 00 01 ff 9e 00 01
	ff 9f 00 01 02 11 00 00 01 11 00 00 00 00 00 00
	00 08 00 00 00 10 00 00 00 00 00 00 00 0e 14 7b
	00 00 00 00 00 01 eb 85 00 00 00 00 00 00 00 00
	00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00
	00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00
/;

opendir(TFM, "tfm") || mkdir("tfm",0755) || die "cannot mkdir tfm";

my @face = qw/mr gr mb gb mgr ml ge/;
my @lang = qw/j t c k/;
my @dir = qw/h v/;
my %font_id = qw/1b g      1d h 1e i 1f j
  20 k 21 l 22 m 23 n 24 o 25 p 26 q 27 r
  28 s 29 t 2a u 2b v 2c w 2d x 2e y 2f z 0f f/;

&MakeSPList::make_sp_char_list(@lang);

&make_utf_tfm;
&make_multi_utf_tfm;
&make_unified_utf_tfm;

sub make_utf_tfm {
	foreach $lang ($lang[0]){ #language, japanase
		foreach $face (@face){ #face
			foreach $dir (@dir){ #direction
				&make_dvipstfm_body($face, $dir, $lang) if ($dir=='h');
				&maketfm_body($face, $dir, $lang);
			}
		}
	}
}
sub make_multi_utf_tfm {
	foreach $lang (@lang[1..$multi]){ #language, t c k
		foreach $face (@face[0..1]){ #face
			foreach $dir (@dir){ #direction
				&maketfm_body($face, $dir, $lang);
			}
		}
	}
}
sub make_unified_utf_tfm {
		foreach $face (@face[0..1]){ #face
			foreach $dir (@dir){ #direction
				&maketfm_body($face, $dir, @lang);
			}
		}
}

sub maketfm_body {
	my ($face, $dir, @ln)=@_;
=comment
		## mktfm.pl does same procedure.
		$filename="utf$lang$face".sprintf("%x",$first_hex)."-$dir";
		open(TEXTFM,">tfm/$filename.tfm") || die "Can't make \'tfm/$filename.tfm\'!\n";
		binmode(TEXTFM);
		if ($i==0) {
			foreach $binary(@tex_tfm_h) {$_ = pack("C", $binary);print TEXTFM "$_";}
		}elsif ($i==1){
			foreach $binary(@tex_tfm_v) {$_ = pack("C", $binary);print TEXTFM "$_";}
		}
		close(TEXTFM);
=cut
	my $lang = join ',', @ln;
	my @exist_head=@{$MakeSPList::r_exist_head->{$lang}};

	foreach $first_hex (0x1b, 0x1d .. 0x2f) { # U+1Cxxx : not defined yet
		next if (!$exist_head[$first_hex]);

		$id = $font_id{sprintf("%02x", $first_hex)};
		$filename= (@ln>1) ? "utf$face$id-$dir" : "utf$lang$face$id-$dir";
		open(TEXTFM,">tfm/$filename.tfm") || die "Can't make \'tfm/$filename.tfm\'!\n";
		binmode(TEXTFM);
		if ($dir eq 'h') {
			foreach $binary(@tex_tfm_h) {$_ = pack("C", $binary);print TEXTFM "$_";}
		}elsif ($dir eq 'v'){
			foreach $binary(@tex_tfm_v) {$_ = pack("C", $binary);print TEXTFM "$_";}
		}
		close(TEXTFM);
	}

	if ($lang eq 'j') {
		$first_hex = 0x0f;
		$id = $font_id{sprintf("%02x", $first_hex)};
		$filename="utf$lang$face$id-$dir";
		open(TEXTFM,">tfm/$filename.tfm") || die "Can't make \'tfm/$filename.tfm\'!\n";
		binmode(TEXTFM);
		if ($dir eq 'h') {
			foreach $binary(@tex_tfm_sub_h) {$_ = pack("C", $binary);print TEXTFM "$_";}
		}elsif ($dir eq 'v'){
			foreach $binary(@tex_tfm_v) {$_ = pack("C", $binary);print TEXTFM "$_";}
		}
		close(TEXTFM);

		$id = '-';
		$filename="utf$lang$face$id-$dir";
		open(TEXTFM,">tfm/$filename.tfm") || die "Can't make \'tfm/$filename.tfm\'!\n";
		binmode(TEXTFM);
		if ($dir eq 'h') {
			foreach $binary(@tex_tfm_ucs_h) {$_ = pack("C", $binary);print TEXTFM "$_";}
		}elsif ($dir eq 'v'){
			foreach $binary(@tex_tfm_v) {$_ = pack("C", $binary);print TEXTFM "$_";}
		}
		close(TEXTFM);
	}
}

sub make_dvipstfm_body {
	my ($face, $dir, $lang)=@_;
=comment
		## mktfm.pl does similar procedure.
		$varfilename="otf-u$lang$face-$dir";
		open(DVIPSTFM,">tfm/$varfilename.tfm") || die "Can't make \'tfm/$varfilename.tfm\'!\n";
		if ($i==0) {
			foreach $binary(@dvips_tfm_h) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
		}elsif ($i==1){
			foreach $binary(@dvips_tfm_v) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
		}
		close(DVIPSTFM);
=cut
		$varfilename= "otf-u$lang$face-$dir";
		open(DVIPSTFM,">tfm/$varfilename.tfm") || die "Can't make \'tfm/$varfilename.tfm\'!\n";
		binmode(DVIPSTFM);
		if ($dir eq 'h') {
			foreach $binary(@dvips_tfm_ucs_h) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
		}elsif ($dir eq 'v'){
			foreach $binary(@dvips_tfm_v) {$_ = pack("C", $binary);print DVIPSTFM "$_";}
		}
		close(TEXTFM);
}
