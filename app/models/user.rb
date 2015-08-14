class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
  has_many :orders
  has_many :order_items
  has_many :addresses

  	def self.find_or_create_by_auth(auth_data)
 	 find_or_create_by_provider_and_uid(auth_data["provider"], auth_data["uid"],
                                     name: auth_data["info"]["name"])
	end

end
