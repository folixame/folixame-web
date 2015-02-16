using 'savon'

class User
  attr_accessor :id
  attr_accessor :email
  attr_accessor :username
  attr_accessor :password
  attr_accessor :join_date
  attr_accessor :profile
  attr_accessor :permission

  def save
    client = Savon.client(wsdl: 'http://156.35.98.14:8088/folixame/Users.asmx?WSDL')

    client.call(:sign_up, message: {email: @email, password: @password})
  end

end