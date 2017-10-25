class NotificationsWorker
  include Sidekiq::Worker

  def perform(house_id)
    # TODO send email about house change
    @house = House.find(house_id)

    Notification.where(house_id: @house.id).includes(:user).find_in_batches do |notifications|
    	notifications.each do |notification|
    		# TODO send email about house change to user
    		user = notification.user
    	end
    end

  end
end
