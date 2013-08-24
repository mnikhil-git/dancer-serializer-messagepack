#!perl

use strict;
use warnings;
use JSON;
use Test::More tests => 6;
use Dancer::Serializer::MessagePack;

my $s = Dancer::Serializer::MessagePack->new();

isa_ok( $s, 'Dancer::Serializer::MessagePack' );
can_ok( $s, qw/serialize deserialize content_type to_msgpack from_msgpack/ );

my $hashref = { you => 'Du', drink => 'trinke', water => 'Wasser' }; 

my $msgpack_to  = Dancer::Serializer::MessagePack::to_msgpack($hashref);
my $msgpack_ser = $s->serialize($hashref);

is( $msgpack_to, $msgpack_ser, 'to_msgpack() and serialize() match' );

my $hash_from = Dancer::Serializer::MessagePack::from_msgpack($msgpack_to);
my $hash_ser  = $s->deserialize($msgpack_ser);

is_deeply( $hash_from, $hash_ser, 'from_msgpack() and deserialize() match' );

is_deeply( $hash_ser, $hashref, 'serialize() and deserialize() correctly' );

is( $s->content_type, 'application/x-msgpack', 'correct content type application/x-msgpack' );
