class Post < ActiveRecord::Base
  belongs_to :category
  before_create :assign_edit_key

  private

  def assign_edit_key
  	self.edit_key = (0..8).map{(65+rand(26)).chr}.join.downcase
  end
end
