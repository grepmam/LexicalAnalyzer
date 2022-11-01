package LexicalAnalyzer;

# ------------

use strict;
use warnings;

use Token;

# ------------

sub new {

    my $class = shift;
    my $self  = {};

    $self->{_string}   = shift;
    $self->{_position} = 0;

    bless $self, $class;

    $self->{_current_char} = $self->get_next_char();

    return $self;

}

sub get_next_char {

    my $self = shift;

    return substr( $self->{_string}, $self->{_position}, 1 );

}

sub get_token {

    my $self = shift;
    my $position;

    if ( !defined $self->{_current_char} ) {
        $position = $self->{_position};
        return Token->new( Token::EOF, 'EOF', $position );
    }

    while ( $self->{_current_char} eq ' ' ) {
        $self->next_position();
    }

    if ( $self->{_current_char} eq '+' ) {
        $position = $self->{_position};
        $self->next_position();
        return Token->new( Token::PLUS, '+', $position );
    }

    if ( $self->{_current_char} eq '-' ) {
        $position = $self->{_position};
        $self->next_position();
        return Token->new( Token::MINUS, '-', $position );
    }

    if ( $self->{_current_char} eq '=' ) {
        $position = $self->{_position};
        $self->next_position();
        return Token->new( Token::ASSIGN, '=', $position );
    }

    if ( $self->{_current_char} =~ m/^[0-9]$/ ) {
        $position = $self->{_position};
        my $number = $self->get_numeric_lexeme();
        return Token->new( Token::INTEGER, $number, $position );
    }

    $self->display_error();

}

sub next_position {

    my $self = shift;
    $self->{_position}++;

    if ( $self->{_position} > length( $self->{_string} ) - 1 ) {
        $self->{_current_char} = undef;
    }
    else {
        $self->{_current_char} = $self->get_next_char();
    }

}

sub get_numeric_lexeme {

    my $self = shift;
    my $lexeme;

    while ( defined $self->{_current_char}
        && $self->{_current_char} =~ m/^[0-9]$/ )
    {
        $lexeme .= $self->{_current_char};
        $self->next_position();
    }

    return $lexeme;

}

sub display_error {

    my $self = shift;

    print "ERROR: Invalid character!\n";
    print "Position: $self->{_position}\n";
    return;

}

1;
