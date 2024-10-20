class CommonsController < ApplicationController
    def index
    end
  
    def new
      @common = Common.new
    end
  
    def show
      @common = Common.find_by(id: params[:id])
    end
  
    def create
      @common = Common.new(common_params)
      params[:common][:question] ? @common.question = params[:common][:question].join("") : false
      if @common.save
          flash[:notice] = "診断が完了しました"
          redirect_to common_path(@common.id)
      else
          redirect_to :action => "new"
      end
    end
  
  private
    def common_params
        params.require(:common).permit(:id, question: [])
    end
end
