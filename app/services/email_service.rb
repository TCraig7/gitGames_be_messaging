class EmailService

  def self.invite_followers(params)
    service = new(params)
    service.validate_username
  end

  def initialize(params)
    @username = params['user']["username"]
    @emails   = params['user']["emails"]
  end

  def validate_username
    user = User.find_by(username: @username)
    if user
      check_last_run(user)
    else
      build_user
    end
  end

  def check_last_run(user)
    if user.updated_at >= (Time.now - 300)
      return "Email Timeout, sending too soon"
    else
      send_emails(user)
    end
  end

  def build_user
    user = User.create(username: @username)
    send_emails(user)
  end

  def send_emails(user)
    update_user(user)
    @emails.each do |email_address|
      FollowerNotifierMailer.inform(@username, email_address).deliver_now
    end
  end

  def update_user(user)
    user.update(updated_at: Time.now)
  end
end
