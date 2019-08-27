class StudentProfile < ApplicationRecord
    validates :nickname, presence: true, length: { maximum: 50 }
    validates :introduction, presence: true, length: { maximum: 1000 }
    
    belongs_to :student
end
