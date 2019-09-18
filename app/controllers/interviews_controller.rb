class InterviewsController < ApplicationController
before_action :require_user_logged_in, only:[:new,:edit,:create,:update,:destroy]
before_action :correct_user, only: [:edit,:update,:destroy]
  
#検索＆検索結果表示ページ
  def index
  end
  
#公開インタビューページ（閲覧はログイン不要）
  def show
    @interview = Interview.find_by(id: params[:id])
    @user = User.find_by(id: @interview.user_id)
  end
  
#インタビュー新規作成  
  def new
    @interview = Interview.new
    @user = current_user
  end
  
#インタビュー編集  
  def edit
    @user = User.find_by(id: @interview.user_id)
  end

  
#インタビュー新規作成(new.html.erbが投稿ページ。)
  def create
   @interview = current_user.build_interview(interview_params)
     @user = current_user
     if @interview.save
       flash[:success] = "インタビューを公開しました"
       redirect_to interview_url(@interview.id)
     else
       flash[:danger] = "インタビューの投稿に失敗しました"
       render "new"
     end
  end
  
  
#インタビュー更新
  def update
    if @interview.update(interview_params)
      flash[:success] = "インタビューは正常に更新されました"
      redirect_to @interview
    else
      flash.now[:danger] = "インタビューの更新に失敗しました"
      render :new
    end
  end
  
#インタビュー削除
  def destroy
   @interview.destroy
   flash[:success] = "インタビューを削除しました"
   redirect_back(fallback_location: root_path)
  end
  
  private
  
  def interview_params
    params.require(:interview).permit(:answer_1,:answer_2,:answer_3,:answer_4,:answer_5,:answer_6,:answer_7,:answer_8,:answer_9,:gakki,:item,:photo,:title)
  end
  
  def correct_user
    @interview = Interview.find_by(id: params[:id])
    if @interview.user_id != @current_user.id
      flash[:danger] = "違うユーザーのインタビューは編集できません"
      redirect_to mypage_path
    end
  end
end
