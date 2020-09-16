class CommentsController < ApplicationController
  
  
  def create
    # new→save = create
    @comment = Comment.new(comment_params)
    #newでインスタンスを生成する
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment,nickname: @comment.user.nickname
    end
    #  redirect_to "/items/#{@comment.item.id}" # コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end


