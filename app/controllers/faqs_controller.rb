# frozen_string_literal: true

class FaqsController < ApplicationController
  def index
    @faqs = Faq.order(:position)
  end
end
