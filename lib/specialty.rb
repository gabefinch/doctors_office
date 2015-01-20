class Specialty
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:save) do
    capture = DB.exec("INSERT INTO specialties (name) VALUES ('#{@name}') RETURNING id;")
    @id = capture.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    specialties = []
    returned_specialties = DB.exec("SELECT * FROM specialties;")
    returned_specialties.each() do |specialty|
      name = specialty.fetch("name")
      id = specialty.fetch("id").to_i()
      specialties.push(Specialty.new({:name => name, :id => id}))
    end
    specialties
  end

  define_method(:==) do |other|
    name = self.name.==(other.name())
    id = self.id().==(other.id())
    name.&(id)
  end


end
