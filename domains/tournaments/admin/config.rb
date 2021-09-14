RailsAdmin.config do |config|
  config.model 'Tournament' do
    field :name
    field :alley
    field :starts_at
    field :difficulty, :enum
    field :events, :enum do
      multiple do
        true
      end
    end
    field :participants, :enum do
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
