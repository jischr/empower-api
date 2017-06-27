class AuthenticateClinician
  prepend SimpleCommand
  attr_accessor :email, :password, :id, :first_name

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(clinician_id: clinician.id) if clinician
  end

  def clinician
    clinician = Clinician.find_by_email(email)
    @id = clinician.id
    @first_name = clinician.first_name
    return clinician if clinician && clinician.authenticate(password)

    errors.add :clinician_authentication, 'invalid credentials'
    nil
  end
end
