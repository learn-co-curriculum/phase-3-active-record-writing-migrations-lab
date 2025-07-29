require_relative '../db/migrate/01_create_students'
require_relative '../db/migrate/20250729005153_add_grade_and_birthdate_to_students'


describe AddGradeAndBirthdateToStudents do
  before do
    sql = "DROP TABLE IF EXISTS students"
    ActiveRecord::Base.connection.execute(sql)

    # Manually runs the migrations
    CreateStudents.new.change
    AddGradeAndBirthdateToStudents.new.change
    
    Student.reset_column_information
  end

  it 'has a grade' do
    student = Student.create(name: "Steven", grade: 12, birthdate: "April 5th")
    expect(Student.where(grade: 12).first).to eq(student)
  end

  it 'has a string birthdate' do
    student = Student.create(name: "Steven", grade: 12, birthdate: "April 5th")
    expect(Student.where(birthdate: "April 5th").first).to eq(student)
  end
end
