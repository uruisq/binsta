class NotificationMailer < ApplicationMailer
  default from: "hogehoge@example.com"

  def sendmail_feed(feed)
    @feed = feed
    mail(
      subject: "投稿が完了しました。", #メールのタイトル
      to: @feed.user.email #宛先
    ) do |format|
      format.text
    end
  end
end
