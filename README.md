# ActiveStorageVariant

[![Build Status](https://app.travis-ci.com/yfxie/active_storage_variant.svg?branch=main)](https://app.travis-ci.com/yfxie/active_storage_variant)
[![Maintainability](https://api.codeclimate.com/v1/badges/c5fc76fb8a53a1b14901/maintainability)](https://codeclimate.com/github/yfxie/active_storage_variantt/maintainability)
[![codecov](https://codecov.io/gh/yfxie/active_storage_variantt/branch/main/graph/badge.svg?token=GJ3JTFRLBI)](https://codecov.io/gh/yfxie/active_storage_variantt)
[![Gem Version](https://badge.fury.io/rb/active_storage_variant.svg)](https://badge.fury.io/rb/active_storage_variant)

The [pre-defined variants](https://github.com/rails/rails/pull/39135) is a very convenient feature.
It's something like the styles option in Paperclip gem. Without it, it is a pain to use ActiveStorage as an alternative to Paperclip.  Thanks to @fatkodima for the contribution.

The cool feature is introduced in Rails 7.
By using this gem, you can take the feature in advance for projects using Rails 6. All configurations are the same, which means when you upgrade to Rails 7 in the future, you can remove this plugin without any effect.

## Installation

```ruby
gem "active_storage_variant"
```

## Usage


```ruby
class User < ActiveRecord::Base
  has_one_attached :avatar do |attachable|
    attachable.variant  :thumb, resize: "100x100"
    attachable.variant :medium, resize: "300x300", monochrome: true
  end
end

class Gallery < ActiveRecord::Base
  has_many_attached :photos do |attachable|
    attachable.variant  :thumb, resize: "100x100"
    attachable.variant :medium, resize: "300x300", monochrome: true
  end
end

<%= image_tag user.avatar.variant(:thumb) %>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yfxie/active_storage_variant.

# License

MIT