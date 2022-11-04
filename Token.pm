package Token;

# ------------

use strict;
use warnings;

# ------------

use constant {

    INTEGER => 'INTEGER',
    MINUS   => 'MINUS',
    PLUS    => 'PLUS',
    SLASH   => 'SLASH',
    ASSIGN  => 'ASSIGN',
    SPACE   => 'SPACE',
    EOF     => 'EOF'

};

# ------------

sub new {

    my $class = shift;
    my $self  = {};

    $self->{_type}     = shift;
    $self->{_value}    = shift;
    $self->{_position} = shift;

    bless $self, $class;

    return $self;

}

sub get_type {

    my $self = shift;
    return $self->{'_type'};

}

sub get_value {

    my $self = shift;
    return $self->{_value};

}

sub get_position {

    my $self = shift;
    return $self->{_position};

}

sub to_string {

    my $self = shift;

    sprintf("Token(%s, %s, %d)", $self->{_type}, $self->{_value}, $self->{_position});

}

1;
