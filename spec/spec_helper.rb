require("rspec")
require("pg")
require("doctor")
require("patient")
require("specialty")


DB = PG.connect({:dbname => "doctors_office_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM specialties *;")
  end
end

# require("rspec")
# require("pg")
# require("list")
# require("task")
#
# DB = PG.connect({:dbname => "to_do_test"})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM lists *;")
#     DB.exec("DELETE FROM tasks *;")
#   end
# end
