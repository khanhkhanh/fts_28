class UserMailer < ApplicationMailer
  def result_notification user
    @user = user
    mail to: user.email, subject: t(:result_notification)
  end

  def exam_notification user
    @user = user
    mail to: user.email, subject: t(:exam_notification)
  end
end
