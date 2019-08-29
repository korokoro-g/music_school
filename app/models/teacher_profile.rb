class TeacherProfile < ApplicationRecord
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :instrument, presence: true, length: { maximum: 50 }
  validates :level, presence: true, length: { maximum: 10 }
  validates :lesson_fee, presence: true, length: { maximum: 11 }
  validates :introduction, presence: true, length: { maximum: 1000 }
  
  belongs_to :teacher
  
  def self.search(search)
    if search
      TeacherProfile.where(['nickname LIKE ? OR instrument LIKE ? OR level LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    end
  end
  
end
