class InMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers

  default from: 'noreply@fator7.com'
end