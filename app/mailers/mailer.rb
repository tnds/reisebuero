class Mailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  default from: "noreply@piraten-nds.de"
  default reply_to: "reisebuero@piraten-nds.de"
end
