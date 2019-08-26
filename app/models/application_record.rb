class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.search(source_search, destination_search)
    where("source LIKE :source OR destination = :destination",
        {:source => "%#{source_search}%", :destination => "%#{destination_search}%"})
  end
end
