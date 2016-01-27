require_relative '../../db/config'
require 'csv'

# class Assembly < ActiveRecord::Base
#   has_and_belongs_to_many :parts
# end
 
# class Part < ActiveRecord::Base
#   has_and_belongs_to_many :assemblies
# end

class Student < ActiveRecord::Base
# implement your Student model here
	validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i ,
    :message => "Email wrong format" }
    validates :email, uniqueness: true
    #validates :age, numericality: { greater_than_or_equal_to: 5 }
    validates :phone, length: { minimum: 12 }

    has_and_belongs_to_many :teachers

	def name(id)
		result = Student.find_by(id: id)
		return result
	end

	

	# def age(id)
	# 	result = Student.find_by(id: id)
	# 	return result[:age]
	# end
end

# student = Student.new
# puts student.name(1).inspect

# CSV.foreach("../../db/data/students.csv") do |row|
# 	p row
# 	puts "========================"
# 	student_hash = {:first_name => row[0],:last_name => row[1],:birthday => row[3],:email => row[4],:phone => row[5],:teacher_id => rand(0..3)}
# 	Student.create(student_hash)
# end