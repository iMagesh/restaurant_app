class NotifyMailer < ApplicationMailer
  default :from => 'support@something.in'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def notify_email_guest(reservation)
    @reservation = reservation
    mail( :to => @reservation.guest.email,
    :subject => 'Your reservations are done!' )
  end

  def notify_email_restaurant(reservation)
    @reservation = reservation
    mail( :to => @reservation.guest.email,
    :subject => 'New booking has been made' )
  end

end
