module JobsHelper
	def check_signed_in_for_new
		user_signed_in? ? new_client_job_path(@client) : new_user_session_path
	end

end
