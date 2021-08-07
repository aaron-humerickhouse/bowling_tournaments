class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  has_one :user_setting

  accepts_nested_attributes_for :user_setting,
                                allow_destroy: true,
                                reject_if: lambda { |attributes|
                                  attributes['zip_code'].blank? ||
                                    attributes['notification_search_radius'].blank? ||
                                    attributes['notification_period'].empty?
                                }

  private

end
