class Like < ActiveRecord::Base
  belongs_to :audio, class_name: Audio
end
