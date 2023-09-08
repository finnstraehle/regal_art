# For mailer
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: 'ourteam.regalart@gmail.com',
  password: 'bcfvhqhtfzdbtgll',
  authentication: :login,
  enable_starttls_auto: true
}
