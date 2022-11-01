# Basic Lexical Analyzer

### Testing

```perl 
my $analyzer = LexicalAnalyzer('7+7');
my $token = $analyzer->get_token();

print $token->get_value();
```

```bash
7
```
