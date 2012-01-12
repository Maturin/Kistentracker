class CratesNotifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crates_notifier.crate_received.subject
  #
  def crate_received(crate)
    @crate = crate

    mail :to => crate.cratepayer.email,
    :subject => 'Kistentracker: Neue Schuldigkeit'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crates_notifier.crate_paid.subject
  #
  def crate_paid(crate)
    @crate = crate

    mail :to => crate.cratepayer.email,
    :subject => 'Kistentracker: Schuldigkeit Bezahlt'
  end
end
