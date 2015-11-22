class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }
  expose(:payments) {Account.all}
  expose(:students)

  #def payments
  #end
end
