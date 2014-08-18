use strict;
use warnings;

use Plack::App::Directory;
use Plack::Builder;

builder {
    enable sub {
        my $app = shift;

        sub {
            my $env = shift;

            $env->{PATH_INFO} = '/index.html' if $env->{PATH_INFO} eq '/';

            $app->($env);
        };
    };

    Plack::App::Directory->new->to_app;
}
