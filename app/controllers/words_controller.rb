class WordsController < ApplicationController
    def index
    end
  
    def new
      @word = Word.new
    end
  
    def show
      @word = Word.find_by(id: params[:id])
    end
  
    def create
      @word = Word.new(word_params)
      params[:word][:question] ? @word.question = params[:word][:question].join("") : false
      if @word.save
          flash[:notice] = "診断が完了しました"
          redirect_to word_path(@word.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def word_params
        params.require(:word).permit(:id, question: [])
    end
end
