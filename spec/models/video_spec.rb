require 'rails_helper'

RSpec.describe Video, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:url) }
  it { should validate_uniqueness_of(:url) }
end
