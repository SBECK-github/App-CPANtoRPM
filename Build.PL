use Module::Build;
use strict;
use warnings;

my %requires = (
                 'perl'                     => '5.00000',
                 'Config'                   => '0',
                 'IO::File'                 => '0',
                 'POSIX'                    => '0',
               );
my %build_mods = (
               );


my $class = Module::Build->subclass(
   class => "Module::Build::Custom",
   code  => q { sub ACTION_html { my $self = shift ; $self->SUPER::ACTION_html ( @_ ) if ( $ENV{ MAKE_HTML } ) ; } }
);

my $build = $class->new(
        license            => 'perl',
        dist_version       => '1.00',
        dist_author        => 'Sullivan Beck <sbeck@cpan.org>',
        module_name        => 'cpantorpm',
        dist_abstract      => 'An RPM package for perl modules',
        requires           => \%requires,
        build_requires     => \%build_mods,
        sign               => 1,
        script_files => [
           'cpantorpm',
           'cpantorpm-depreq',
        ],
);

$build->create_build_script;
