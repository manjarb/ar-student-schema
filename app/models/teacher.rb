require_relative '../../db/config'
require_relative 'student'

class Teacher < ActiveRecord::Base
	#store name,email,phone
	validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i ,
    :message => "Email wrong format" }
    validates :email, uniqueness: true
    #validates :age, numericality: { greater_than_or_equal_to: 5 }
    validates :phone, length: { minimum: 12 }

    has_and_belongs_to_many :students

	def self.save_data(attributes)
		teacher = Teacher.new(attributes)
		if teacher.save
			puts "save teacheroo"
		else
			puts "not save teacher booo"
		end
	end

	def matches_students
		array = []
		4.times {
			array << Student.find(rand(1..5))
		}
		self.students = array
	end

	# def test_relation
	# 	#@order = @customer.orders.create(order_date: Time.now)
	# 	Teacher.Student.all.each { |x|
	# 		puts x.inspect
	# 	}
	# end

end

#puts ""

# for i in 0..8
# 	Teacher.save_data({:name => "hest#{i} tacher",:email => "xxa#{i}@aa.co",:phone => "112231111111144",:student_id => rand(1..54)})
# end

teacher = Teacher.find(1)
teacher.matches_students

puts teacher.students.inspect

# Teacher.all.each { |x|
# 	puts x.inspect
# }
#puts Teacher.first