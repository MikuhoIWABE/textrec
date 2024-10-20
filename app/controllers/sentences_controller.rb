class SentencesController < ApplicationController
    def index
    end
  
    def new
      @Sentence = Sentence.new
    end
  
    def show
      @Sentence = Sentence.find_by(id: params[:id])
    end
  
    def create
      @Sentence = Sentence.new(sentence_params)
      params[:Sentence][:question] ? @Sentence.question = params[:Sentence][:question].join("") : false
      if @Sentence.save
          flash[:notice] = "診断が完了しました"
          redirect_to sentense_path(@Sentence.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def sentence_params
        params.require(:Sentence).permit(:id, question: [])
    end
end
