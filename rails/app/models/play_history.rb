class PlayHistory < ActiveRecord::Base
  belongs_to :audio, class_name: Audio
end
