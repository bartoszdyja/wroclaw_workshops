class Account < ActiveRecord::Base
  belongs_to :student

  validates_presence_of :balance, :payment_date
end
