# frozen_string_literal: true

class Video < ApplicationRecord
  validates :title, :author, :url, presence: true
  validates :url, uniqueness: true
end
