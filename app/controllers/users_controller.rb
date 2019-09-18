class UsersController < ApplicationController
before_action :require_user_logged_in, only:[:show,:update,:destroy]


#検索一覧（条件ヒットに限る）
  def index
   @users = User.order(id: :desc).page(params[:page]).per(25)
  end
  
#マイページ(プロフィール表示)
  def show
   @user = current_user
   @interview = @user.interview
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
      render :show
    end
  end
  
#退会処理
  def destroy
  end
end

private

def user_params
 params.require(:user).permit(:name, :email, :password, :password_confirmation,:icon, :icon_cache, :remove_icon,:area,:age,:gender,:part,:category,:sns_1,:sns_2)
end
