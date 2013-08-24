
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  'build_requires' => {
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.3601',
    'Test::Fatal' => '0',
    'Test::More' => '0'
  },
  'configure_requires' => {
    'ExtUtils::MakeMaker' => '6.31',
    'Module::Build' => '0.3601'
  },
  'dist_abstract' => 'MessagePack serializer for Dancer',
  'dist_author' => [
    'Nikhil Mulley <mnikhil@cpan.org>'
  ],
  'dist_name' => 'Dancer-Serializer-MessagePack',
  'dist_version' => '0.01',
  'license' => 'perl',
  'module_name' => 'Dancer::Serializer::MessagePack',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Carp' => '0',
    'Dancer' => '0',
    'Dancer::Serializer::Abstract' => '0',
    'Data::MessagePack' => '0.46'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
