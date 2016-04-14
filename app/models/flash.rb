class Flash < ActiveRecord::Base

  include ObjectModel::Model
  include ValidationsForTorent 
  belongs_to :film

end
