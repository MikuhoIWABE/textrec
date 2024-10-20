class GrammarsController < ApplicationController
    def index
    end
  
    def new
      @grammar = Grammar.new
    end
  
    def show
      @grammar = Grammar.find_by(id: params[:id])
    end
  
    def create
      @grammar = Grammar.new(grammar_params)
      params[:grammar][:question] ? @grammar.question = params[:grammar][:question].join("") : false
      if @grammar.save
          flash[:notice] = "診断が完了しました"
          redirect_to grammar_path(@grammar.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def grammar_params
        params.require(:grammar).permit(:id, question: [])
    end
end
