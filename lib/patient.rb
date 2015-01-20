class Patient
  attr_reader(:name, :doctor_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes[:name]
    @doctor_id = attributes[:doctor_id]
    @id = attributes[:id]
  end

  define_method(:save) do
    capture = DB.exec("INSERT INTO patients (name, doctor_id) VALUES ('#{@name}', '#{@doctor_id}') RETURNING id;")
    @id = capture.first().fetch('id').to_i()
  end

  define_singleton_method(:all) do
    patients = []
    returned_patients = DB.exec("SELECT * FROM patients;")
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      id = patient.fetch("id").to_i()
      doctor_id = patient.fetch("doctor_id").to_i()
      patients.push(Patient.new({:name => name, :id => id, :doctor_id => doctor_id}))
    end
    patients
  end

  define_singleton_method(:find_doctor_id) do |doctor_id|
    patients = []
    matched_patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{doctor_id};")
    matched_patients.each() do |patient|
      name = patient.fetch("name")
      id = patient.fetch("id").to_i()
      doctor_id = patient.fetch("doctor_id").to_i()
      patients.push(Patient.new({:name => name, :id => id, :doctor_id => doctor_id}))
    end
    patients
  end

  define_method(:==) do |other|
    name = self.name.==(other.name())
    doctor_id = self.doctor_id().==(other.doctor_id())
    id = self.id().==(other.id())
    name.&(doctor_id).&(id)
  end

end
