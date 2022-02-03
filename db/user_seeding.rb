require 'csv'
require_relative './data/users.csv'

def seed_users
  csv_file_path = './data/users.csv'
  puts "Seed users from #{csv_file_path}..."
  f = File.new(csv_file_path, r)
  csv = CSV.new(f)
  headers = csv.shift

  # csv.each do |row|
  #   user_information = {
      
  #   }
  # end
end