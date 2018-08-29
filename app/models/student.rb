class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(input)
    if input.empty?
      Student.all
    else
      matches = []
      Student.all.each do |student|

        s = student.name.scan(/#{input}/i).first

        if s != nil
          matches << student
        end
      end

      matches
    end





  end


end
