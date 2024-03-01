package Poster;
use Mojo::Base 'Mojolicious', -signatures;

# This method will run once at server start
sub startup($self) {

    # Load configuration from config file
    my $config = $self->plugin('JSONConfig');

    # Configure the application
    $self->secrets($config->{secrets});

    helper sqlite => sub {state $sql = Mojo::SQLite->new('sqlite:test.db')};

    # Router
    my $r = $self->routes;

    # Normal route to controller
    $r->get('/')->to('Example#welcome');
}

1;
