Pony.options = {
  from: "schmidtfarms2009@gmail.com",
  via: :smtp,
  via_options: {
    address:              "smtp.sendgrid.net",
    port:                 "587",
    user_name:            ENV["SMTP_USERNAME"] ||
                          raise("Please set SMTP_USERNAME"),
    password:             ENV["SMTP_PASSWORD"] ||
                          raise("Please set SMTP_PASSWORD"),
    authentication:       "plain",
    enable_starttls_auto: true,
  },
}
