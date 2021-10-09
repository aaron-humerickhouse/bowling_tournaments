# frozen_string_literal: true

RailsAdmin.config do |config|
  config.model 'Tournament' do
    field :name
    field :alley
    field :starts_at

    # field :difficulty
    # field :events
    # field :participants

    field :difficulty, :enum do
      enum_method do
        :difficulty_enum
      end
    end
    field :events, :enum do
      enum_method do
        :events_enum
      end
      multiple do
        true
      end
    end
    field :participants, :enum do
      enum_method do
        :participants_enum
      end
      multiple do
        true
      end
    end
    field :flyer_url
    field :contact_name
    field :contact_email
    field :contact_phone
  end
end
