class GreatsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user = User.find(params[:great_id])
    current_user.praise(user)
    flash[:success] = "このインタビューに拍手を贈りました！"
    redirect_to user
  end

  def destroy
    user = User.find(params[:great_id])
    current_user.unpraise(user)
    flash[:danger] = "このインタビューの拍手を取り消しました。"
    redirect_to user
  end
end
