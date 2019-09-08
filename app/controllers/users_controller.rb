class UsersController < ApplicationController

#検索一覧（条件ヒットに限る）
  def index
   @users = User.order(id: :desc).page(params[:page]).per(25)
  end
  
#マイページ
  def show
   @user = User.find(params[:id])
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
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
#マイページの編集
  def edit
  end
  
#プロフィール更新実行
  def update
  end
  
#退会処理
  def destroy
  end
end

private

def user_params
 params.require(:user).permit(:name, :email, :password, :password_confirmation)
end