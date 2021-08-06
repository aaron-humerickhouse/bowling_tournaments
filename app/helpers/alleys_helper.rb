# frozen_string_literal: true

require 'states_helper'

module AlleysHelper
  def states_option
    ::States.map { |key, value| [value, key] }
  end
end
