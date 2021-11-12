require "simplecov"
SimpleCov.start do
  add_filter "dummy"
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

ENV["RAILS_ENV"] ||= "test"
require "dummy/config/environment"
require "active_support/testing/autorun"
require "pry"

class ActiveSupport::TestCase
  self.file_fixture_path =  File.expand_path("fixtures", __dir__)

  def fixture_file_upload(filename)
    Rack::Test::UploadedFile.new file_fixture(filename).to_s
  end

  def read_image(blob_or_variant)
    MiniMagick::Image.open blob_or_variant.service.send(:path_for, blob_or_variant.key)
  end
end

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Schema.define do
  create_table :users do |t|
    t.string :name
    t.timestamps
  end
end
ActiveRecord::Migrator.migrations_paths += [File.expand_path("db/migrate",  Gem.loaded_specs["activestorage"].full_gem_path)]
ActiveRecord::Base.connection.migration_context.migrate

class User < ActiveRecord::Base
  has_one_attached :avatar
  has_one_attached :one_with_purge, dependent: :purge
  has_one_attached :one_with_variants do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end
  has_many_attached :many_with_variants do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end
end