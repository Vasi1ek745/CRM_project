class Job < ApplicationRecord
	belongs_to :client

	validates :date, :start_time, presence: true

	



end

