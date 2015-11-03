class Sensor < ActiveRecord::Base
  has_many :readings
  belongs_to :user
end
