require('spec_helper')

describe('Patient') do
  describe('#save') do
    it('will save the Patient into the database') do
      test_patient = Patient.new(:name => "Mr. Jones", :doctor_id => 420, :id => nil)
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
