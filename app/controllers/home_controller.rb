# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @data = mockup_data
  end

  def mockup_data
    [
      {
        id: 1,
        total: 9,
        location_name: "Phnom Penh",
        active: 9,
        recovered: 0,
        fatal: 0,
        lat: 11.562108,
        lng: 104.888535
      },
      {
        id: 2,
        total: 1,
        location_name: "Preah Sihanouk",
        active: 0,
        recovered: 1,
        fatal: 0,
        lat: 10.627543,
        lng: 103.522141
      },
      {
        id: 2,
        total: 3,
        location_name: "Kampong Cham",
        active: 3,
        recovered: 0,
        fatal: 0,
        lat: 12.05,
        lng: 105.25
      }
    ]
  end
end
