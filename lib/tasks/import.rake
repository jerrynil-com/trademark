namespace :import do

  desc "Import categories from csv"
  task categories: :environment do
    counter = 0
    CSV.foreach("categories.csv") do |row|
      number, name = row
      category = Category.create(number: number, name: name)
      counter += 1 if category.persisted?
    end
    puts "Imported #{counter} categories"
  end

  desc "Import items from csv"
  task items: :environment do
    counter = 0
    (1..45).each do |f|
      CSV.foreach("goods/items_#{f}.csv") do |row|
        group_code, name = row
        item = Category.find_by(number: f).items.create(group_code: group_code, name: name)
        counter += 1 if item.persisted?
      end
      puts "Imported #{counter} items"
    end
  end
end