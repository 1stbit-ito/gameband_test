class User < ActiveRecord::Base
  self.primary_key = :user_id
  #user_id validation
  validates :user_id, length: { minimum: 8, maximum: 16}
  validates :user_id, format: { with: /[a-zA-Z0-9]*/}
  validates :user_id, uniqueness: true
  validates :login_id, uniqueness: true

  validates :nickname, presence: true
end
