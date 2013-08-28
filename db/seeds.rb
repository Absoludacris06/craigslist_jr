require 'csv'

File.open(File.expand_path('db/category_seed.txt'), 'r').each do |line|
  new_category = Category.new({:name => line.chomp})
  new_category.save!
end

CSV.open(File.expand_path('db/post_seed.csv'), :headers => true).each do |row|
	p row
  return_values = row.to_hash.select { |k, v| Post.column_names.include?(k) }
  p return_values
  new_post = Post.new(return_values)
  new_post.save!
end
