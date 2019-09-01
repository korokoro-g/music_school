class Student < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :birthday, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :booked_at, presence: true
  
  has_secure_password
  
  has_one :student_profile, dependent: :destroy
  
  has_many :bookings
  has_many :lesson_teacher, through: :bookings, source: :teacher
  
end
