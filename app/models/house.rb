class House < ApplicationRecord

	belongs_to :user

	validates :house_type, presence: true
	validates :room, presence: true, numericality: { only_integer: true}
	validates :bathroom, presence: true, numericality: { only_integer: true}
	validates :price, presence: true, numericality: { only_integer: true}

end
