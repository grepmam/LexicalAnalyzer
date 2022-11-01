#!/usr/bin/perl

use lib ".";

use LexicalAnalyzer;
use Test::Simple tests => 10;

# ---- Declarations ----

my $analyzer;
my $token;


# ---- 1st case: 45+7 ----

$analyzer = LexicalAnalyzer->new("45+7");
$token;

$token = $analyzer->get_token();
ok($token->get_value() eq 45);

$token = $analyzer->get_token();
ok($token->get_value() eq '+');

$token = $analyzer->get_token();
ok($token->get_value() eq 7);

$token = $analyzer->get_token();
ok($token->get_value() eq 'EOF');


# ---- 2nd case: 6  + 60 -6 ----

$analyzer = LexicalAnalyzer->new("6  + 60 -6");

$token = $analyzer->get_token();
ok($token->get_value() eq 6);

$token = $analyzer->get_token();
ok($token->get_value() eq '+');

$token = $analyzer->get_token();
ok($token->get_value() eq 60);

$token = $analyzer->get_token();
ok($token->get_value() eq '-');

$token = $analyzer->get_token();
ok($token->get_value() eq 6);

$token = $analyzer->get_token();
ok($token->get_value() eq 'EOF');
