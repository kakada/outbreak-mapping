# frozen_string_literal: true

class Faq < ApplicationRecord
  acts_as_list

  before_create :set_position

  private
    def set_position
      self.position = Faq.maximum(:position).to_i + 1
    end
end
