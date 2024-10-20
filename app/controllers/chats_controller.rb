class ChatsController < ApplicationController
        def index
        end
      
        def new
          @chat = Chat.new
        end
      
        def show
          @chat = Chat.find_by(id: params[:id])
        end
      
        def create
          @chat = Chat.new(chat_params)
          params[:chat][:question] ? @chat.question = params[:chat][:question].join("") : false
          if @chat.save
              flash[:notice] = "診断が完了しました"
              redirect_to chat_path(@chat.id)
          else
              redirect_to :action => "new"
          end
        end
      
      private
        def chat_params
            params.require(:chat).permit(:id, question: [])
        end

end
