class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy
  has_many :subject_items, through: :participations
  has_one :account, dependent: :destroy

  accepts_nested_attributes_for :subject_items

  after_create :set_payment_date

  validates :first_name, :last_name, presence: true

  def set_payment_date
    Account.create!(payment_date: Date.today + 30.days, student: self)
  end
end
