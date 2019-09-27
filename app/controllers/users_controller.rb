class UsersController < ApplicationController
before_action :require_user_logged_in, only:[:show,:update,:destroy,:praises,:be_praises]

#検索一覧
  def index
   @q = User.joins(:interview).ransack(params[:q])
   @users = @q.result(distinct: true).order(id: :desc).page(params[:page]).per(5)
  end
  
#マイページ(プロフィール表示)
  def show
   @user = current_user
   @interview = @user.interview
   @praises = @user.praises.page(params[:page]).per(5)
  end
  
#新規登録画面
  def new
    @user = User.new
  end
  
#新規登録実行
  def create
  @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
#プロフィール変更ページ  
  def edit
   @user = current_user
  end
  
#プロフィール更新実行
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました。"
      redirect_to mypage_url
    else
      flash[:danger] = "プロフィール更新に失敗しました"
      render :show
    end
  end
  
#退会処理
  def destroy
    @user = User.find_by(id: params[:id])
    @interview = Interview.find_by(user_id: params[:id])
    flash[:success] = "退会しました(インタビューも削除されました)"
    
     if @interview.nil?
      @user.destroy
      redirect_to("/")
     else
      @interview.destroy
      @user.destroy
      redirect_to("/")
     end
  end
  
  def be_praises
    @user = User.find(params[:id])
    @be_praises = @user.be_praises.page(params[:page]).per(5)
  end


  private

  def user_params
   params.require(:user).permit(
     :name, :email, :password, :password_confirmation,:icon, :icon_cache, :remove_icon,:icon_prev,:icon_img,
     :area,:age,:gender,:part,:category,:twitter,:facebook,:instagram,:comment)
  end
  
  def search_params
    params.require(:q).permit(:name_cont,:comment_cont,:interview_title_cont)
  end
end

