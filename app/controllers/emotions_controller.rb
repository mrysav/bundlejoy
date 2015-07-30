class EmotionsController < ApplicationController
    before_filter :require_valid_user
    
    def index
        @emotions = current_user.emotions.paginate(:page => 1, :per_page => 10)
    end
    
    def new
        @emotion = current_user.emotions.new
    end
    
    def create
        @emotion = current_user.emotions.create(emotion_params)
        
        if @emotion.save
            redirect_to emotions_path
        else
            render 'new'
        end
    end
    
    def show
        @emotion = current_user.emotions.find(params[:id])
    end
    
    def edit
        @emotion = current_user.emotions.find(params[:id])
    end
    
    def update
        @emotion = current_user.emotions.find(params[:id])
        
        if @emotion.update(emotion_params)
            redirect_to emotions_path
        else
            render 'edit'
        end
    end
    
    def destroy
        @emotion = current_user.emotions.find(params[:id])
        
        if @emotion.destroy
            redirect_to emotions_path
        else
            render 'show'
        end
    end
    
    def emotion_params
        params.require(:emotion).permit(:name, :description, :latitude, :longitude)
    end
end
