class Post < ActiveRecord::Base
  attr_accessible :body, :title, :slug

  extend FriendlyId
  friendly_id :title, use: :slugged
end
