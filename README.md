Active_Ext
==========

[![Code Climate](https://codeclimate.com/github/darthjee/active_ext/badges/gpa.svg)](https://codeclimate.com/github/darthjee/active_ext)
[![Test Coverage](https://codeclimate.com/github/darthjee/active_ext/badges/coverage.svg)](https://codeclimate.com/github/darthjee/active_ext/coverage)
[![Issue Count](https://codeclimate.com/github/darthjee/active_ext/badges/issue_count.svg)](https://codeclimate.com/github/darthjee/active_ext)

# Usage
This project adds some new methods to the core active_record classes

To use active-ext either intall directly

```console
gem install darthjee-active_ext
```

or add it to Gemfile

```
gem 'darthjee-active_ext'
```

```console
bundle install darthjee-active_ext
```

# methods added

## ActiveRecord::Relation

```ruby
ActiveRecord::Schema.define do
  self.verbose = false
  
  create_table :documents, :force => true do |t|
    t.string :status
    t.timestamps null: true
  end
end


class Document < ActiveRecord::Base
  scope :with_error, -> { where(status: :error) }
  scope :with_success, -> { where(status: :success) }
end

3.times { Document.with_error.create }
Document.with_success.create
```

### percentage
Returns the percentage of objects of a certain scope within another scope

```ruby
Document.all.percentage(:with_error)
0.75
```

```ruby
Document.all.percentage(status: :error)
0.75
```

```ruby
Document.all.percentage("status = 'error'")
0.75
```
