#!/usr/bin/perl
#
# search/sitemap
# scan specified directory for all ".md" files
# optionally look for search string, and make a list
#

use strict;
use HTML::Tiny;
use CGI::Tiny;


my $cgi = $_;

my $root = "../en";
my $debug = 0;

my $do_html = 1;

#
# check_match_print
# check for match to $srch in $str
# print in a nice way, pointing out the match string
#
# if $do_html is set, return an HTML-formatted string for any match
#
sub check_match_print {
    my ($pre, $str, $srch) = @_;

    my $i = index( $str, $srch);
    
    my $sn = length( $str);
    my $rn = length( $srch);

    my $local_html = "";

    return if( $i < 0);

    # need to truncate beginning?
    if( $i+$rn > 80) {
	$str = substr $str, $i-40;
	$i = 40;
	$sn = length( $str);
    }

    # need to truncate end
    if( $sn > 80) {
	$str = substr( $str, 0, 80);
    }

    if( $do_html) {
	$local_html .= "<font color=\"blue\">";
	$local_html .= "<br><samp>" . '&nbsp;' x length($pre)
					   . substr($str,0,$i)
					   . "<b>"
					   . substr($str,$i,$rn)
					   . "</b>"
					   . substr($str,$i+$rn)
					   . "</samp>\n"
					   . "</font>";
    } else {
	print $pre, $str, "\n";
	print $pre, ' ' x $i, "^\n";
    }

    $local_html;
}


#
# recursively scan a directory for files
#
sub scan {
    my ($d, $level, $srch, $match) = @_;
    print "scan( $d, $level)\n" if($debug);

    die "Runaway at $d, $level\n" if( $level > 5);

    my $local_html = "";
    my $dh;
    my $pre = ' ' x $level;

    # read all files and directories
    opendir( $dh, $d) || die "Can't opendir: $!";
    my @filez = grep { !/\.$/ && (-f "$d/$_" || -d "$d/$_") } readdir($dh);
    closedir $dh;

    foreach my $f ( @filez ) {
	$f = $d . "/" . $f;
	#--- it's a file, print name and optionally search in it
	if( -f "$f" && $f =~ /\.md$/) {
	    if( $do_html) {

		my $res = "";
		if( $srch) {
		    # search file
		    print $pre, "Search $f for $srch\n" if($debug);
		    open my $fh, '<:encoding(UTF-8)', $f or die "Opening $f $:";
		    while( my $line = <$fh>) {
			chomp $line;
			$res .= check_match_print( $pre, $line, $srch);
		    }
		    close $fh;
		}

		# link to file
		# need to rewrite ../en/mdwiki/file.md
		# to http://hertz.bu.edu/~hazen/wiki/en/#!mdwiki/OddBlockOctal.md 
		# or maybe        ../en/#!mdwiki/file.md
		my $target = $f;
		$target =~ s/en\/mdwiki\//en\/#!mdwiki\//;
#		$local_html .= "<BR><B>res=\"$res\" match=\"$match\"";
		if( $res ne "" || $match ne "on") {
		    $local_html .= "<br>" .'&nbsp;' x length($pre). qq{<a href="$target">$f</a>\n};
		}
		$local_html .= $res;
	    } else {
		print $pre, $f, "\n";
	    }

	    #--- it's a directory, scan it
	} elsif( -d "$f" ) {
	    if( $do_html) {
		if( $match ne "on") {
		    $local_html .= "<br>" . ' ' x length($pre) . $f . "/\n";
		}
	    } else {
		print $pre, $f, "/\n";
	    }
	    $local_html .= scan( $f, $level+1, $srch, $match);
	}
    }
    $local_html;
}


#
# handle the CGI request
#
cgi {
    my $cgi = $_;
    my $h = HTML::Tiny->new( mode => 'html');

    my $search = $cgi->query_param('search');
    my $match = $cgi->query_param('only');

    my $html = "<h1>Site Map</h1>" .
    "Auto-generated at " . `date` . "<p>";

    $html .= $h->form( {action => 'make_sitemap.pl'} , "<br>" .
		       $h->b("Enter search term:  ") . $h->input( {name => 'search', value=>"$search"}) . "<br>" .
		       "Only files which match:" . (($match eq "on") ?
		       $h->input( {name => 'only', type => 'checkbox', checked => "on"}) :
		       $h->input( {name => 'only', type => 'checkbox'})) . "<br>" .
		       $h->input( {type => 'submit'})
	);

    $html .= scan( $root, 0, $search, $match);

    $cgi->render( html => $html);

}
