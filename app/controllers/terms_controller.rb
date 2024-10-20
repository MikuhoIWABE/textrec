class TermsController < ApplicationController
    def index
    end
  
    def new
      @term = Term.new
    end
  
    def show
      @term = Term.find_by(id: params[:id])
    end
  
    def create
      @term = Term.new(term_params)
      params[:term][:question] ? @term.question = params[:term][:question].join("") : false
      if @term.save
          flash[:notice] = "診断が完了しました"
          redirect_to term_path(@term.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def term_params
        params.require(:term).permit(:id, question: [])
    end
end
