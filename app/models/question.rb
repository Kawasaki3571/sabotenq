class Question < ApplicationRecord
	has_many :answears, dependent: :destroy
end
