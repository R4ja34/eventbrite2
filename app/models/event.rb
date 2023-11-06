class Event < ApplicationRecord
  validates :start_date, presence: true
  validate :start_date_in_future

  validates :duration, presence: true
  validates :duration, numericality: { only_integer: true, greater_than: 0 }
  validates :duration, format: { with: /\A\d+\z/ }
  validate :duration_multiple_of_5
  
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  
  validates :description, presence: true, length: { in: 10..1000 }
  
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  
  validates :location, presence: true

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: "User", foreign_key: "admin_id"


  private
  
  def start_date_in_future
    if start_date.present? && start_date <= Time.current
      errors.add(:start_date, "doit être dans le futur")
    end
  end

  def duration_multiple_of_5
    if duration.present? && duration % 5 != 0
      errors.add(:duration, "doit être un multiple de 5")
    end
  end

end
