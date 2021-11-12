module ActiveStorageVariant
  module Reflection
    def variant(name, transformations)
      variants[name] = transformations
    end

    def variants
      @variants ||= {}
    end
  end
end