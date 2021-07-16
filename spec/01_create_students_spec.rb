require_relative '../db/migrate/01_create_students'

describe CreateStudents do
  before do
    sql = "DROP TABLE IF EXISTS students"
    ActiveRecord::Base.connection.execute(sql)
    
    # Manually runs the migration
    CreateStudents.new.change
  end

  it 'has a name' do
    student = Student.create(name: "Steven")
    expect(Student.where(name: "Steven").first).to eq(student)
  end
end
