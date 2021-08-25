require "administrate/base_dashboard"

class TournamentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    alley: Field::BelongsTo,
    contact_name: Field::String,
    contact_phone: Field::String,
    contact_email: Field::String,
    id: Field::Number,
    name: Field::String,
    starts_at: Field::DateTime,
    events: Array[Field::String],
    difficulty: Field::String,
    participants: Array[Field::String],
    flyer_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    name
    alley
    starts_at
    contact_name
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    name
    alley
    contact_name
    contact_phone
    contact_email
    starts_at
    events
    participants
    difficulty
    flyer_url
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    alley
    contact_name
    contact_phone
    contact_email
    name
    starts_at
    events
    difficulty
    participants
    flyer_url
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how tournaments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(tournament)
  #   "Tournament ##{tournament.id}"
  # end
end
