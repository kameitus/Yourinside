class UsersController < ApplicationController
before_action :require_user_logged_in, only:[:show,:update,:destroy]


#検索一覧（条件ヒットに限る）
  def index
   @users = User.order(id: :desc).page(params[:page]).per(25)
  end
  
#マイページ(編集可能)
  def show
   @user = current_user
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
  
  
#プロフィール更新実行
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_url, notice: "success"
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
 params.require(:user).permit(:name, :email, :password, :password_confirmation,:icon, :icon_cache, :remove_icon)
end
