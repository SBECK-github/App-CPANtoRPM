
use ExtUtils::MakeMaker;
use 5.00000;
use strict;
use warnings;
my %requires = (
                 'Config'                   => '0',
                 'IO::File'                 => '0',
                 'POSIX'                    => '0',
               );


WriteMakefile(
        NAME             => 'cpantorpm',
        VERSION          => '1.00',
        ($] >= 5.00000
        ? (ABSTRACT=>'An RPM package for perl modules',
           AUTHOR  =>'Sullivan Beck (sbeck@cpan.org)')
        : ()),
        'dist' => {COMPRESS=>'gzip',SUFFIX=>'gz'},
        PL_FILES  => {},
        PREREQ_PM => \%requires,
        EXE_FILES => [
           'cpantorpm',
           'cpantorpm-depreq',
        ],
);
