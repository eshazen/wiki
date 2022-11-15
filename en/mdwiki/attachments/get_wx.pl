#!/usr/bin/perl
#
my $URL = 'https://www.aviationweather.gov/adds/dataserver_current/httpparam' .
    '?dataSource=tafs' .
    '&requestType=retrieve' .
    '&format=xml' .
    '&hoursBeforeNow=2' .
    '&mostRecentForEachStation=true' .
    '&stationString=KBED,KPSM';

my $html = qx{wget --quiet --output-document=- '$URL'};

print "URL: $URL\n";
print "Got: \"$html\"\n";
