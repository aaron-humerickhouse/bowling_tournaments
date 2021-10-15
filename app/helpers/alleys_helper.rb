# frozen_string_literal: true

require 'states'

module AlleysHelper
  def states_option
    ::STATES.map { |key, value| [value, key] }
  end
end
