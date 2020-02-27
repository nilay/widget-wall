class User < ApplicationRecord
  include UserPresenter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #============ Association =============
  has_many :widgets, class_name: 'UserWidget'
  has_many :visible_widgets, -> { where(user_widgets: {kind: :visible}) },  class_name: 'UserWidget'
  has_many :hidden_widgets, -> { where(user_widgets: {kind: :hidden}) },  class_name: 'UserWidget'

  class << self
    def authenticate(email, password)
      user = User.find_for_authentication(email: email)
      user.try(:valid_password?, password) ? user : nil
    end
  end

end
