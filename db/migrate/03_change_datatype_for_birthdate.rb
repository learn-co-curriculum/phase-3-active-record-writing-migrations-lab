class ChangeDatatypeForBirthdate < ActiveRecord::Migration[8.0]
  def change
    change_column :students, :birthdate, :datetime
  end
end
