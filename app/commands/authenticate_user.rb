class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :email, :password, :id, :first_name

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
    @first_name = user.first_name
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
