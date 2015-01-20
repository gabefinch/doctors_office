require('spec_helper')

describe(Patient) do
  describe('#save') do
    it('will save the Patient into the database') do
      test_patient = Patient.new(:name => "Mr. Jones", :doctor_id => 420, :id => nil)
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe('.all') do
    it('returns all rows from patients as array of objects') do
      test_patient1 = Patient.new(:name => "Mr. Jones", :doctor_id => 420, :id => nil)
      test_patient1.save()
      test_patient2 = Patient.new(:name => "Mr. Bones", :doctor_id => 001, :id => nil)
      test_patient2.save()
      test_patient3 = Patient.new(:name => "Mr. Cajones", :doctor_id => 420, :id => nil)
      test_patient3.save()
      expect(Patient.all()).to(eq([test_patient1, test_patient2, test_patient3]))
    end
  end

  describe('.find_doctor_id') do
    it('returns an array of all patient objects matching a doctor_id') do
      test_patient1 = Patient.new(:name => "Dr. Jones", :doctor_id => 420, :id => nil)
      test_patient1.save()
      test_patient2 = Patient.new(:name => "Dr. Bones", :doctor_id => 001, :id => nil)
      test_patient2.save()
      test_patient3 = Patient.new(:name => "Dr. Cajones", :doctor_id => 420, :id => nil)
      test_patient3.save()
      expect(Patient.find_doctor_id(420)).to(eq([test_patient1, test_patient3]))
    end
  end

end
