class Order < ApplicationRecord
  belongs_to :loading_station, optional: true
  belongs_to :unloading_station, optional: true
end
