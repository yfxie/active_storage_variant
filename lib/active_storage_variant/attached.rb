module ActiveStorageVariant
  module Attached
    extend ActiveSupport::Concern

    class_methods do
      def has_one_attached(name, *arg)
        super
        reflection = self.reflect_on_attachment(name)
        yield reflection if block_given?
      end

      def has_many_attached(name, *arg)
        super
        reflection = self.reflect_on_attachment(name)
        yield reflection if block_given?
      end
    end
  end
end