require_relative '../config'

# this is where you should use an ActiveRecord migration to 

# def change
#     create_table :assemblies do |t|
#       t.string :name
#       t.timestamps null: false
#     end
 
#     create_table :parts do |t|
#       t.string :part_number
#       t.timestamps null: false
#     end
 
#     create_table :assemblies_parts, id: false do |t|
#       t.belongs_to :assembly, index: true
#       t.belongs_to :part, index: true
#     end
#   end

class CreateStudents < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :students do |t|
        t.integer :teacher_id
    	t.string :first_name
        t.string :last_name
        t.string :gender
        t.string :email
        t.string :phone
    	t.date :birthday
        t.datetime :created_at
        t.datetime :updated_at
    end

    create_table :teachers do |t|
        t.integer :student_id
        t.string :name
        t.string :email
        t.string :phone
        t.datetime :created_at
        t.datetime :updated_at
    end

    create_table :students_teachers, id: false do |t|
      t.belongs_to :student, index: true
      t.belongs_to :teacher, index: true
    end
  end
end
