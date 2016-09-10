object :@exercise
attributes :id, :name

child(:categories) { attributes :id, :name }
