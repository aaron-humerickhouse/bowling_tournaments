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

  def notify_for_tournament?(tournament:)
    return false if self.user_setting.notification_period.include?(0)

    days_away = tournament.starts_at.day - Date.today.day
    puts "User #{self.id} - days away: #{days_away}"
    max_notify_window = user_setting.notification_period.sort.last
    puts "User #{self.id} - max_notify_window: #{max_notify_window}"
    # TODO: Test interaction between nightly notify and tournament notify
    return false if max_notify_window <= days_away
    puts "User #{self.id} - inside of notification window"

    user_zip_code = user_setting.zip_code
    puts "User #{self.id} - user_zip_code: #{user_zip_code}"

    search_distance = user_setting.notification_search_radius
    puts "User #{self.id} - search_distance: #{search_distance}"

    tournament_distance = Geocoder::Calculations.distance_between(
      tournament.alley.address.geolocation, Geocoder.coordinates(user_zip_code)
    )
    puts "User #{self.id} - tournament_distance: #{tournament_distance}"

    if search_distance <= tournament_distance
      puts "User #{self.id} should be notified"

      true
    else
      puts "User #{self.id} should not be notified"

      false
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
