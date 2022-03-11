class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :activity_not_found

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
    end

    private

    def activity_not_found
        render json: {error: "Activity not found"}, status: :not_found
    end
end
