requires 'perl', '>= 5.008001';
requires 'JavaScript::Minifier';
requires 'Apache2::Const';
requires 'Apache2::Filter';
requires 'Apache2::Log';
requires 'Apache2::RequestRec';
requires 'Apache2::RequestUtil';
requires 'APR::Table';
requires 'namespace::clean';

recommends 'JavaScript::Minifier::XS';

test_requires 'Apache::Test', '>= 1.12';
test_requires 'File::Slurp';
test_requires 'LWP::UserAgent';
test_requires 'Test::More', '>= 0.96';
