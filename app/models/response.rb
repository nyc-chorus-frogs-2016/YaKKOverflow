class Response < ActiveRecord::Base
  belongs_to :respondable, polymorphic: true
  belongs_to :user

end
