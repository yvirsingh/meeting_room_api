class MeetingsController < ApplicationController
	def create
		@meeting = Meeting.new(meeting_params)
		if @meeting.save!
			render json: @meeting
		else
			render error: {error: 'unable to create a meeting'}, status: 400
		end
	end

	def update
		@meeting = meeting
		if @meeting
			@meeting.update(meeting_params)
			render json: {message: 'meeting has been updated successfully'}, status: 200
		else
			render error: {error: 'unable to update meeting'}, status: 400
		end
	end

	def destroy
		@meeting = meeting
		if @meeting
			@meeting.update(cancel_reason: meeting_params[:cancel_reason], status: 3)
			render json: {message: 'meeting has been resigned successfully'}, status: 200
		else
			render error: {error: 'unable to resign meeting'}, status: 400
		end
	end

	private

	def meeting_params
		params.require(:meeting).permit(:title, :start_datetime, :end_datetime, :number_of_attendes, :agenda, :cancel_reason, :status, members_attributes: [:user_id, :meeting_id])
	end

	def meeting
		@meeting = Meeting.find(params[:id])
	end
end
