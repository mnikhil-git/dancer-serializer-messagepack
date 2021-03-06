package Dancer::Serializer::MessagePack;

use strict;
use warnings;
use Carp;
use Dancer::ModuleLoader;
use Dancer::Deprecation;
use Dancer::Config 'setting';
use Dancer::Exception qw(:all);
use base 'Dancer::Serializer::Abstract';


# helpers

sub to_msgpack {
  my $s = Dancer::Serializer::MessagePack->new;
  return $s->serialize(@_);
}

sub from_msgpack {
  my $s = Dancer::Serializer::MessagePack->new;
  return $s->deserialize(@_);
}

# class definition

sub loaded { Dancer::ModuleLoader->load_with_params('Data::MessagePack') }

sub init {
  my ($self) = @_;
  raise core_serializer => 'Data::MessagePack is needed and is not installed'
    unless $self->loaded;
}

sub serialize {
  my $self   = shift;
  my $entity = shift;

  my $depth = 1024;
  return Data::MessagePack->pack($entity) || 
      croak "Unable to serialize the entity ! \n";
}

sub deserialize {
  my $self   = shift;
  my $entity = shift;

  return Data::MessagePack->unpack($entity) ||
      croak "Unable to deserialize the entity ! \n";
}

sub content_type {'application/x-msgpack'}

1;


#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Dancer::Serializer::MessagePack


=head1 DESCRIPTION

    This serializer serializes your data structure to MessagePack format.

    It uses Data::MessagePack "pack" and "unpack" functions.

=head1 IMPLEMENTS

L<Dancer::Serializer::Abstract> 

=head1 SYNOPSIS

    # in your Dancer app:
    setting serializer => 'MessagePack';

    # or in your Dancer config file:
    serializer: 'MessagePack'

=head1 METHODS

=head2 init

    An initializer that is called automatically by Dancer.

    Runs "loaded".

=head2 loaded

    Lazily loads Data::MessagePack and imports the appropriate functions.

=head2 serialize

    Serializes a given data to MessagePack format

=head2 to_msgpack

    Helper function to create a new Dancer::Serializer::MessagePack object and
    run "serialize".

=head2 deserialize

    Deserializes a given data from MessagePack format.

=head2 from_msgpack

    Helper function to create a new Dancer::Serializer::MessagePack object and
    run "deserialize".

=head2 content_type

    Returns the content type which is application/x-msgpack.

=head1 SEE ALSO

    Data::MessagePack
    https://github.com/msgpack/msgpack-perl

=head1 AUTHOR

    Nikhil Mulley <mnikhil@cpan.org>

=head1 COPYRIGHT AND LICENSE

    This software is copyright (c) 2013 by Nikhil Mulley.

    This is free software; you can redistribute it and/or modify it under
    the same terms as the Perl 5 programming language system itself.

=cut

