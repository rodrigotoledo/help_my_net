# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         jwt_revocation_strategy: JwtDenylist
  after_create :update_access_token!
  extend FriendlyId
  friendly_id :first_name, use: :slugged
  has_many :tasks
  has_many :author_tasks, class_name: "Task", foreign_key: "author_id"
  has_one :employee

  private

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end
end
