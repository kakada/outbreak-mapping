class V1::ReportSerializer < ActiveModel::Serializer
  attributes :updated_at, :location, :total_case, :new_case, 
    :total_recovered_case, :new_recovered_case, 
    :total_death_case, :new_death_case

  belongs_to :location, serializer: V1::LocationSerializer

  def total_recovered_case
    object.recovered_case
  end

  def total_death_case
    object.death_case
  end

end
