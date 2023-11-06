class User < ApplicationRecord
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  has_many :attendances
  has_many :events, trought: :attendances
  has_many :admin_events, class_name: "Event", foreign_key: "admin_id"
end
