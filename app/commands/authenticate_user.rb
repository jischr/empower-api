class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email, :password, :id

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  def user
    user = User.find_by_email(email)
    @id = user.id
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
