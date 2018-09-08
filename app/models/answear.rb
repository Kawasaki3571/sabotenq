class Answear < ApplicationRecord
	belongs_to :user
	belongs_to :question
	# validates :final_answear, presence: true
	# validates :answear_text, presence: true, length: { minimum: 8}
	has_many :favorites, dependent: :destroy
	has_many :replies, dependent: :destroy


    def favorited_by?(user)
       favorites.where(user_id: user.id).exists?
    end
end