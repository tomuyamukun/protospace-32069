class PrototypesController < ApplicationController
  # except以外がおきるとログインページに飛ぶ
  before_action :authenticate_user!, except: [:index, :new, :show, :create, :edit]
  before_action :move_to_index, only: :edit 

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end
#定義したストロングパラメーターをcreateメソッドで実行
#if文はデータ保存できたらルートパス、できなかったら新規投稿ページへ移行
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

def show
  @prototype = Prototype.find(params[:id])
  @comment = Comment.new
  # includesメソッドは、引数に指定された関連モデルを1度のアクセスでまとめて取得できます。
  @comments = @prototype.comments.includes(:user)

end

def edit
  @prototype = Prototype.find(params[:id])
end

def update
  # prototypeをインスタンス変数に変換
  @prototype = Prototype.find(params[:id])
  if @prototype.update(prototype_params)
    redirect_to root_path
  else
    render :edit
  end
end

 def destroy
  prototype = Prototype.find(params[:id])
  prototype.destroy
  redirect_to root_path
 end



#ストロングパラメータを定義
#ストロングパラメーターをセットし、特定の値のみを受け付けるようにした。且つ、user_idもmergeした
  private 
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  
#@prototypeがnilとでて空だとなっていたので下で定義して与えた
  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless  user_signed_in? && current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end

end
