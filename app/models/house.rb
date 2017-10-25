class House < ApplicationRecord

	belongs_to :user

	validates :house_type, presence: true
	validates :room, presence: true, numericality: { only_integer: true}
	validates :bathroom, presence: true, numericality: { only_integer: true}
	validates :price, presence: true, numericality: { only_integer: true}

	#house pictures
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	after_save :send_notification



	private


	def send_notification
		NotificationsWorker.perform_async(self.id)
	end
end
