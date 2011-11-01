class Child < ActiveRecord::Base
  belongs_to :user
  validates :name, :police_abstract_no, :gender, :missing_city, :presence => true
  validates :police_abstract_no, :uniqueness => true

end
