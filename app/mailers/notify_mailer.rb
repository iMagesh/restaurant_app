class NotifyMailer < ApplicationMailer
  default :from => 'support@something.in'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def notify_email_guest(guest, reservation)
    @guest = guest
    @reservation = reservation
    mail( :to => @guest.email,
    :subject => 'Your reservations are done!' )
  end

end
