class UsersController < ApplicationController

  require 'csv'

  def import
    file = params[:file]
    # return redirect_to request.refer, notice: "Only cvs format" unless params[:file].content_type == "text/csv"
    return redirect_to users_path, notice: "Only cvs format" unless file.content_type == "text/csv"

    CsvImportUsersService.new.call(file)

    redirect_to users_path, notice: 'Users imported'
  end

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv
    end
  end

end




# # app/controllers/users_controller.rb
# def import
#   return redirect_to request.referer, notice: 'No file added' if params[:file].nil?
#   return redirect_to request.referer, notice: 'Only CSV files allowed' unless params[:file].content_type == 'text/csv'

#   CsvImportService.new.call(params[:file])

#   redirect_to request.referer, notice: 'Import started...'
# end

# # app/services/csv_import_service.rb
# class CsvImportService
#   require 'csv'

#   def call(file)
#     opened_file = File.open(file)
#     options = { headers: true, col_sep: ';' }
#     CSV.foreach(opened_file, **options) do |row|

#       # map the CSV columns to your database columns
#       user_hash = {}
#       user_hash[:email] = row['Email Address']
#       user_hash[:username] = user_hash[:email].split('@').first
#       user_hash[:name] = row['First Name']
#       user_hash[:surname] = row['Last Name']
#       user_hash[:preferences] = row['Favorite Food']
#       user_hash[:phone] = row['Mobile phone number']

#       User.find_or_create_by!(user_hash)
#       # for performance, you could create a separate job to import each user
#       # CsvImportJob.perform_later(user_hash)
#     end
#   end
# end

# # csv inside file block
# File.open(file) do |file|
#   CSV.parse(file, headers: true, col_sep: ";")
# end

# # open a file
# file = File.read(file) => string
# file = File.open(file) => object

# csv = CSV.parse(file, headers: true, col_sep: ";")
# options = { headers: true, col_sep: ";" }
# csv = CSV.parse(file, **options)
# csv = CSV.open(file, **options)
# csv = CSV.read(file.path, **options) # alternative - no need to read/open file

# kv_hash_csv = csv.each.to_a.compact
# kv_hash = csv.map(&:to_h)

# csv.headers
# # gets header values (first row)

# csv.each { |row| p row }

# csv.each { |row| p row.to_hash }

# # manipulate a row
# csv.each do |row|
#   row
#   row.to_hash
#   row.headers
#   row.fields

#   # option 1 (if CSV headers = User.attributes)
#   row_hash = row.to_hash
#   User.find_or_create_by!(row_hash)

#   # option 2
#   email = row['Email Address']
#   username = email.split('@').first
#   name = row['First Name']
#   surname = row['Last Name']
#   preferences = row['Favorite Food']
#   phone = row['Mobile phone number']
#   User.find_or_create_by!(email:, username:, name:, surname:, preferences:, phone:)

#   # option 3 (best)
#   user_hash = Hash.new
#   user_hash[:email] = row['Email Address']
#   user_hash[:username] = user_hash[:email].split('@').first
#   user_hash[:name] = row['First Name']
#   user_hash[:surname] = row['Last Name']
#   user_hash[:preferences] = row['Favorite Food']
#   user_hash[:phone] = row['Mobile phone number']
#   # user_hash[:abc] = "xyz"
#   User.find_or_create_by!(user_hash)
# end