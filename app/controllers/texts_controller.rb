class TextsController < ApplicationController
    def index
    end
  
    def new
      @text = Text.new
    end
  
    def show
      @text = Text.find_by(id: params[:id])
    end
  
    def create
      @text = Text.new(text_params)
      params[:text][:question] ? @text.question = params[:text][:question].join("") : false
      if @text.save
          flash[:notice] = "診断が完了しました"
          redirect_to text_path(@text.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def text_params
        params.require(:text).permit(:id, question: [])
    end
end
