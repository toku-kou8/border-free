class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver
      redirect_to root_path, notice: 'お問い合わせ内容を送信しました'
    else
      render :new
    end
  end

  # 入力内容に誤りがあった場合、
  # 入力内容を保持したまま前のページに戻るのが当たり前になっているかと思いますが、
  # backアクションを定義することで可能となります。
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  # 送信完了画面を使用する場合お使いください。
  def done
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:name_kana,:email,:phone,:title,:content)
  end

end
