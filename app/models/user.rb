class User
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :email, :username, :password, :join_date, :profile, :permission

  validates_presence_of :email, :password

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def save
    client = Savon.client(wsdl: 'http://156.35.98.14:8088/folixame/Users.asmx?WSDL')
    p client
    p 'Saving: ' + @email + ' ' + @password
    response = client.call(:save, message: {email: 'test2', password: 'test2'})
    p response.body
  end

  def persisted?
    false
  end
end
