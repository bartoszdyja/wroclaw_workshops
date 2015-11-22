class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }
  expose(:accounts) {Account.includes(:student)}
end
