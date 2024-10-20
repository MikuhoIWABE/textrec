class LanguagesController < ApplicationController
    def index
    end
  
    def new
      @language = Language.new
    end
  
    def show
      @language = Language.find_by(id: params[:id])
    end
  
    def create
      @language = Language.new(language_params)
      params[:language][:question] ? @language.question = params[:language][:question].join("") : false
      if @language.save
          flash[:notice] = "診断が完了しました"
          redirect_to language_path(@language.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def language_params
        params.require(:language).permit(:id, question: [])
    end
end


def show
  @language = Language.find(params[:id])
  @comments = @language.comments
  @comment = Comment.new
end