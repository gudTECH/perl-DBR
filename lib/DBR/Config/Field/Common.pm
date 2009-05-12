# the contents of this file are Copyright (c) 2009 Daniel Norman
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation.

package DBR::Config::Field::Common;

use strict;
use base 'DBR::Common';

sub makevalue{ undef }
sub table_id { undef };
sub field_id { undef };
sub name     { die "shouldn't get here" };
sub is_pkey  { undef }
sub table    { undef }
sub is_numeric{ undef }


sub table_alias{
      my $self = shift;
      my $set = shift;
      if($set){
	    return $self->{table_alias} = $set;
      }

      return $self->{table_alias};

}

sub index{
      my $self = shift;
      my $set = shift;
      return $self->{index} = $set if defined($set);

      return $self->{index};
}

sub validate { 1 }

sub sql  {
      my $self = shift;
      my $name  = $self->name;
      my $alias = $self->table_alias;

      my $sql;
      $sql  = $alias . '.' if $alias;
      $sql .= $name;

      if ( $self->{do_dealias} ) {
	    $sql .= " AS $name";
      } elsif ( $self->{do_alias} ) {
	    $sql .= " AS '$alias.$name'";
      }

      return $sql;
}

1;