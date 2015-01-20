require('spec_helper')

describe(Doctor) do
  describe('#save') do
    it('will save the Doctor into the database') do
      test_doctor = Doctor.new(:name => "Dr. Jones", :specialty_id => 420, :id => nil)
      test_doctor.save()
      expect(Doctor.all()).to(eq([test_doctor]))
    end
  end

  describe('.all') do
    it('returns all rows from doctors as array of objects') do
      test_doctor1 = Doctor.new(:name => "Dr. Jones", :specialty_id => 420, :id => nil)
      test_doctor1.save()
      test_doctor2 = Doctor.new(:name => "Dr. Bones", :specialty_id => 001, :id => nil)
      test_doctor2.save()
      test_doctor3 = Doctor.new(:name => "Dr. Cajones", :specialty_id => 420, :id => nil)
      test_doctor3.save()
      expect(Doctor.all()).to(eq([test_doctor1, test_doctor2, test_doctor3]))
    end
  end

  describe('.find_specialty_id') do
    it('returns an array of all doctor objects matching a specialty_id') do
      test_doctor1 = Doctor.new(:name => "Dr. Jones", :specialty_id => 420, :id => nil)
      test_doctor1.save()
      test_doctor2 = Doctor.new(:name => "Dr. Bones", :specialty_id => 001, :id => nil)
      test_doctor2.save()
      test_doctor3 = Doctor.new(:name => "Dr. Cajones", :specialty_id => 420, :id => nil)
      test_doctor3.save()
      expect(Doctor.find_specialty_id(420)).to(eq([test_doctor1, test_doctor3]))
    end
  end

end
