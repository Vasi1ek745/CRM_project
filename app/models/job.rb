class Job < ApplicationRecord
	belongs_to :client
	belongs_to :user

	validates :date, :start_time, presence: true

	



end

