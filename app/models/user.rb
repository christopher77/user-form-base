class User < ApplicationRecord

  validates :first_name,:last_name,:username,:email,
  :email_confirmation,:password,:password_hint, presence: true
  validates :first_name,  length: { in: 2..60 }
  validates :last_name, :length => { in: 2..60 }
  validates :username, :uniqueness => true, :length => { in: 2..20 }
  validates :email,:uniqueness => true,confirmation: true, 
  :format => {:with=> /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password, confirmation: true, length: { minimum: 8 },
  :format => { :with=>/\A^(?=.*\d)(?!.*\s).{4,8}$\z/ }
  validates :password_hint,:length=>{:maximum =>100}

  def full_name
    "#{first_name} #{last_name}"
  end

end


def articles_params
  params
end
