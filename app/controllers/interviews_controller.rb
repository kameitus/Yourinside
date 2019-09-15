class InterviewsController < ApplicationController
before_action :require_user_logged_in, only:[:new,:create,:update,:destroy]
  
#検索＆検索結果表示ページ
  def index
    @interviews = current_user.interviews.order(id: :desc).page(params[:page])
  end
  
#公開インタビューページ（閲覧はログイン不要）
  def show
  end
  
  def new
    @user = current_user
  end
  
#インタビュー新規作成(new.html.erbが投稿ページ。)
  def create
   @interview = current_user.interview.build(interview_params)
     if @interview.save
       flash[:success] = "インタビューを公開しました"
       redirect_to "interviews#show"
     else
       flash[:danger] = "インタビューの投稿に失敗しました"
       redirect_to "users#show"
     end
  end
  
  
#インタビュー更新
  def update
  end
  
#インタビュー削除
  def destroy
  end
  
  private
  
  def interview_params
    params.require(:interview).permit(:answer_1,:answer_2,:answer_3,:answer_4,:answer_5,:answer_6,:answer_7,:answer_8,:answer_9,:gakki,:item,:photo,:title)
  end
  
end
