class AddStudentToSubjectItems < ActiveRecord::Migration
  def change
    add_reference :subject_items, :student, index: true, foreign_key: true
  end
end
