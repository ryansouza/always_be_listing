class List < ActiveRecord::Base
  validates_presence_of :name, :title
  validates_format_of :name, with: /\A[a-zA-Z_\-0-9]+\z/, message: "must contain only alpha-numeric, underscores, and dashes"
end
