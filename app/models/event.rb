class Event
 include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :id, :name, :place, :short_description, :long_description, :date, :start_date, :end_date, :validated, :category

  validates_presence_of :name

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def save
    client = Savon.client(wsdl: 'http://156.35.95.51:8080/wsfolixameevents/events?wsdl')
    p client
    p 'Saving: ' + @email + ' ' + @password
    response = client.call(:create_event, message: {name: @name})
    p response.body
  end

=begin
  def sign_up
    client = Savon.client(wsdl: 'http://156.35.98.14:8088/folixame/Users.asmx?WSDL')
    p client
    p 'Saving: ' + @email + ' ' + @password
    response = client.call(:sign_up, message: {email: 'test2', password: 'test2'})
    p response.body
  end
=end

  def persisted?
    false
  end
end