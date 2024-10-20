class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    language = Language.find(params[:language_id])
    comment = language.comments.build(comment_params)
    if comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path) 
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path) 
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
