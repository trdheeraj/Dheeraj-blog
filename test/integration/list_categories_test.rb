require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category_1 = Category.create(name: "sports")
		@category_2 = Category.create(name: "programming")
	end

	test "should show categories listing" do
		get categories_path
		assert_template 'categories/index'
		assert_select "a[href=?]", category_path(@category_1), text: @category_1.name
		assert_select "a[href=?]", category_path(@category_2), text: @category_2.name
	end
end