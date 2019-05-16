# Cache helper
module CacheHelper
  def self.json_cache(movies, title, root, serializer)
    Rails.cache.fetch(Movie.cache_key(movies, title)) do
      ActiveModelSerializers::SerializableResource.new(movies, root: root, each_serializer: serializer).to_json
    end
  end
end
