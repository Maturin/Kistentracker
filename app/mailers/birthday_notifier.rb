class BirthdayNotifier < ActionMailer::Base
  default :from => "no-reply@kistentracker.de"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.birthday_notifier.send.subject
  #
  def send_mail(to, birthday_names)
    @birthday_names = birthday_names

    mail :to => to,
    :subject => "Happy Birthday #{@birthday_names}"
  end
end
