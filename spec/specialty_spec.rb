require('spec_helper')

describe('Specialty') do
  describe('#save') do
    it('will save the specialty into the database') do
      test_specialty = Specialty.new(:name => "Proctology", :id => nil)
      test_specialty.save()
      expect(Specialty.all()).to(eq([test_specialty]))
    end
  end

  describe('.all') do
    it('returns all specialties') do
      test_specialty1 = Specialty.new(:name => "Proctology", :id => nil)
      test_specialty1.save()
      test_specialty2 = Specialty.new(:name => "Oncology", :id => nil)
      test_specialty2.save()
      test_specialty3 = Specialty.new(:name => "Gynecology", :id => nil)
      test_specialty3.save()
      expect(Specialty.all()).to(eq([test_specialty1, test_specialty2, test_specialty3]))
    end
  end

end
