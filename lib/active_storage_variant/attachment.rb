module ActiveStorageVariant
  module Attachment
    def variant(transformations)
      case transformations
        when Symbol
          variant_name = transformations
          transformations = variants.fetch(variant_name) do
            record_model_name = record.to_model.model_name.name
            raise ArgumentError, "Cannot find variant :#{variant_name} for #{record_model_name}##{name}"
          end
      end

      super(transformations)
    end

    private
    def variants
      record.attachment_reflections[name]&.variants
    end
  end
end