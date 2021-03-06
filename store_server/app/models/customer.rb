class Customer < ActiveRecord::Base
  
  attr_accessible :email_address, :password, :password_confirmation
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email_address
  validates_uniqueness_of :email_address
    
  has_many :orders
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def self.authenticate(email, password)
    customer = find_by_email_address(email)
    if customer && customer.password_hash == BCrypt::Engine.hash_secret(password, customer.password_salt)
      customer
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
end
