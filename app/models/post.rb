class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :comments, reject_if: proc {|attr| attr['name'].blank? }
  accepts_nested_attributes_for :users, reject_if: proc {|attr| attr['name'].blank? }
  accepts_nested_attributes_for :categories, reject_if: proc {|attr| attr['name'].blank? }


#   def categories_attributes=(category_attributes)
#     if !category_attributes.blank?
#     category_attributes.values.each do |category_attribute|
#       category = Category.find_or_create_by(category_attribute)
#       self.categories << category
#     end
#   end
# end

  # def users_attribute=(user_attributes)
  #   user_attributes.values.each do |user_attribute|
  #     user=User.find_or_create_by(user_attribute)
  #     self.users << user
  #   end
  # end


end
