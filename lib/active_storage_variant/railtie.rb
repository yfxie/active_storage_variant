require "rails/railtie"

module ActiveStorageVariant
  class Railtie < ::Rails::Railtie
    initializer "active_storage_variant.attached", after: "active_storage.attached"  do
      require "active_storage_variant/attached"
      ActiveRecord::Base.include ActiveStorageVariant::Attached
    end

    initializer "active_storage_variant.reflection" do
      require "active_storage_variant/reflection"
      ActiveStorage::Reflection::HasManyAttachedReflection.include ActiveStorageVariant::Reflection
      ActiveStorage::Reflection::HasOneAttachedReflection.include ActiveStorageVariant::Reflection
    end

    initializer "active_storage_variant.attachment" do
      require "active_storage_variant/attachment"
      ActiveSupport.on_load(:active_storage_attachment) do
        include ActiveStorageVariant::Attachment
      end
    end
  end
end