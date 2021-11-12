require "test_helper"

class ActiveStorageVariantTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(name: "abc")
  end

  test "test_that_it_has_a_version_number" do
    refute_nil ::ActiveStorageVariant::VERSION
  end

  test "reflection.variants is a hash" do
    one_reflection = User.reflect_on_attachment(:one_with_variants)
    many_reflection = User.reflect_on_attachment(:many_with_variants)

    assert_instance_of Hash, one_reflection.variants
    assert_instance_of Hash, many_reflection.variants
  end

  test"reflection.variants contains variants values" do
    one_reflection = User.reflect_on_attachment(:one_with_variants)
    many_reflection = User.reflect_on_attachment(:many_with_variants)

    assert_equal ({ resize: "100x100" }), one_reflection.variants[:thumb]
    assert_equal ({ resize: "100x100" }), many_reflection.variants[:thumb]
  end

  test "creating variation by variation name" do
    @user.one_with_variants.attach fixture_file_upload("racecar.jpg")
    @user.many_with_variants.attach fixture_file_upload("racecar.jpg")
    one_variant = @user.one_with_variants.variant(:thumb).processed
    many_variant = @user.many_with_variants.first.variant(:thumb).processed

    [one_variant, many_variant].each do |variant|
      image = read_image(variant)
      assert_equal "JPEG", image.type
      assert_equal 100, image.width
      assert_equal 67, image.height
    end
  end

  test "raises error when unknown variant name is used" do
    @user.one_with_variants.attach fixture_file_upload("racecar.jpg")
    error = assert_raises ArgumentError do
      @user.one_with_variants.variant(:unknown).processed
    end

    assert_match(/Cannot find variant :unknown for User#one_with_variants/, error.message)
  end
end