class NewPostRepresenter < Roar::Decorator
  include Roar::JSON

  property :text
  property :url
  property :image_url
  property :created_at

  collection :hashtags
end
