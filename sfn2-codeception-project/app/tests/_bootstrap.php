<?php
// This is global bootstrap for autoloading 
 
$faker = Faker\Factory::create();
 
for( $x=0 ; $x<5 ; $x++ ) {
 printf( "%s <%s> from %s\n", 
  $faker->name,
  $faker->email,
  $faker->city );
}