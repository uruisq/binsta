class NotificationMailer < ApplicationMailer
  default from: 'from@bindyne.com'

  def sendmail_feed(feed)
    @feed = feed
    mail to: feed.user.email,
      subject: "投稿が完了しました。"
  end
end
