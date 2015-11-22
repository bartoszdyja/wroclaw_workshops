class AddStudentToAccounts < ActiveRecord::Migration
  def change
    add_reference :accounts, :student, index: true, foreign_key: true
  end
end
