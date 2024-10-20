class InterpretationsController < ApplicationController
        def index
        end
      
        def new
          @interpretation = Interpretation.new
        end
      
        def show
          @interpretation = Interpretation.find_by(id: params[:id])
        end
      
        def create
          @interpretation = Interpretation.new(interpretation_params)
          params[:interpretation][:question] ? @interpretation.question = params[:interpretataion][:question].join("") : false
          if @interpretation.save
              flash[:notice] = "診断が完了しました"
              redirect_to interpretation_path(@interpretation.id)
          else
              redirect_to :action => "new"
          end
        end
      
      private
        def interpretation_params
            params.require(:interpretation).permit(:id, question: [])
        end

end
