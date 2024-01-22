class CsvImportUsersService 

  require 'csv'

  def call(file)
    # file = File.open(file)
    # csv = CSV.parse(file, headers: true, col_sep: ";")
    # csv = CSV.parse(file, headers: true )
    # csv.each do |row|
    #   user_hash = Hash.new
      # user_hash[:username] = row["username"]
      # user_hash[:email] = user_hash[email].split('@').first
      # user_hash[:email] = row["email"]
      # user_hash[:name] = row["name"]
      # user_hash[:surname] = row["surname"]
      # user_hash[:phone] = row["phone"]
      # user_hash[:preferences] = row["preferences"]
      # User.create(user_hash)
      # binding.pry
    # end
  end
end