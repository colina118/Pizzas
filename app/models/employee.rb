class Employee < ActiveRecord::Base
  belongs_to :branch
  has_secure_password
  validates :user, uniqueness: true, presence: true 
  validates :name, presence: true
  validates :lastname, presence: true
  validates :branch_id, presence: true
  validates :password_digest, presence: true



end
