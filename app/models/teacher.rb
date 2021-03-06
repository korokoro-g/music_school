class Teacher < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :birthday, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 255 }
  has_secure_password
  
  has_one :teacher_profile, dependent: :destroy
  
  has_many :bookings
  has_many :lesson_students, through: :bookings, source: :student
  
end
