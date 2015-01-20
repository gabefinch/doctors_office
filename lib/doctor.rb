class Doctor
  attr_reader(:name, :specialty_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @specialty_id = attributes[:specialty_id]
    @id = attributes[:id]
  end

  define_method(:save) do
    capture = DB.exec("INSERT INTO doctors (name, specialty_id) VALUES ('#{@name}', '#{@specialty_id}') RETURNING id;")
    @id = capture.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    doctors = []
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i()
      specialty_id = doctor.fetch("specialty_id").to_i()
      doctors.push(Doctor.new({:name => name, :id => id, :specialty_id => specialty_id}))
    end
    doctors
  end

  define_singleton_method(:find_specialty_id) do |specialty_id|
    doctors = []
    matched_doctors = DB.exec("SELECT * FROM doctors WHERE specialty_id = #{specialty_id};")
    matched_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i()
      specialty_id = doctor.fetch("specialty_id").to_i()
      doctors.push(Doctor.new({:name => name, :id => id, :specialty_id => specialty_id}))
    end
    doctors
  end

  define_method(:==) do |other|
    name = self.name.==(other.name())
    specialty_id = self.specialty_id().==(other.specialty_id())
    id = self.id().==(other.id())
    name.&(specialty_id).&(id)
  end

end
