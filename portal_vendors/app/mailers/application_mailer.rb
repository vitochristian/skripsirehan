# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'App Supplier <app.supplier@nutrifood.co.id>'
  layout 'mailer'
end