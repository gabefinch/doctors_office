require('pg')
require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/doctor')
require('./lib/patient')
require('./lib/specialty')

DB = PG.connect({:dbname => "doctors_office"})

get ('/') do
  @specialties = Specialty.all()
  @doctors = Doctor.all()
  @patients = Patient.all()
  erb(:home)
end

post ('/specialties') do
  name = params.fetch("name")
  specialty = Specialty.new({:name => name, :id => nil})
  specialty.save()
  redirect '/'
end

post ('/doctors') do
  name = params.fetch("name")
  specialty_id = params.fetch("specialty_id")
  doctor = Doctor.new({:name => name, :specialty_id => specialty_id, :id => nil})
  doctor.save()
  redirect '/'
end

post ('/patients') do
  name = params.fetch("name")
  doctor_id = params.fetch("doctor_id")
  patient = Patient.new({:name => name, :doctor_id => doctor_id, :id => nil})
  patient.save()
  redirect '/'
end
