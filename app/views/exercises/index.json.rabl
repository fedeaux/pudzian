collection :@exercises
attributes :id, :name

child(:categories) { attributes :id, :name }
