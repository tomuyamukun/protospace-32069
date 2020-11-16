class PrototypesController < ApplicationController
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
end


#ストロングパラメータを定義
#ストロングパラメーターをセットし、特定の値のみを受け付けるようにした。且つ、user_idもmergeした
  private 
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  

end
