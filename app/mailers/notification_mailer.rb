class NotificationMailer < ApplicationMailer
  default from: "hogehoge@example.com"

  def sendmail_feed(feed)
    @feed = feed
    mail to: "@feed.user.email",
      subject: "投稿が完了しました。"
  end
end
