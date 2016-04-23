class Category < ActiveRecord::Base

  @model_of_attachment='upload_picture'.parameterize.underscore.to_sym
  include ValidationsForPicture

end
