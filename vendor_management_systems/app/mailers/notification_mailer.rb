class NotificationMailer < ApplicationMailer
  def verify_vendor(vendor, password)
    @vendor = vendor
    @password = password
    mail(to: vendor.sales_email, subject: 'Registrasi Portal Supplier Nutrifood')
  end

  def decline_vendor(vendor)
    @vendor = vendor
    mail(to: vendor.sales_email, subject: 'Registrasi Portal Supplier Nutrifood')
  end

  def expample(transaction, base_url)
    @recipent = MsRoleAccess.get_mailer_for_save(transaction.ms_form_id)
    @transaction = transaction
    @url = [:edit_transaction, @transaction, host: base_url]
    mail(to: @recipent, subject: 'Portal Vendor | Maaf, akun anda tidak dapat diverifikasi.')
  end
end
