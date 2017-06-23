class AuthenticateClinician
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(clinician_id: clinician.id) if clinician
  end

  private

  attr_accessor :email, :password

  def clinician
    clinician = Clinician.find_by_email(email)
    return clinician if clinician && clinician.authenticate(password)

    errors.add :clinician_authentication, 'invalid credentials'
    nil
  end
end
