class CatsController < ApplicationController
    
    def new
        @cat = Cat.new 
        render :new 
    end

    def index
        @cats = Cat.all 
        render :index 
    end

    def create 
        @cat = Cat.new(cat_params) 
        if @cat.save 
            redirect_to cat_url(@cat) 
        else
            render json: @cat.errors.full_messages, status: :unprocessable_entity 
        end
    end
    
    def show 
        @cat = Cat.find_by(id: params[:id])
        render :show 
    end

    def edit 
        @cat = Cat.find_by(id: params[:id])
        render :edit 
    end

    def update 
        @cat = Cat.find_by(id: params[:id])
        if @cat.update(cat_params) 
            redirect_to cat_url(@cat) 
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end

    private 

    def cat_params 
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description) 
    end

end
