class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :rpx_connectable

  #
  # Fields
  #
  field :name, :type => String

  #
  # Allowed users
  #
  ADMIN_USERS = ['david.padilla@crowdint.com', 'esteban.cortes@crowdint.com']

  def is_admin?
    ADMIN_USERS.include?(self.email)
  end
end
