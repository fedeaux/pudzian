collection :@exercises
attributes :id, :name, :has_strenght_test

child(:categories) { attributes :id, :name }
