class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        activities = Activity.all
        render json: activities, status: :ok
      end


      def show
        activity = Activity.find(params[:id])
        render json: activity, status: :ok
      end


  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    head :no_content
  end


      private
      def signup_params
        params.permit(:name, :difficulty)
      end

      def render_not_found_response
        render json: { error: "Activity not found" }, status: :not_found
      end
    
end
