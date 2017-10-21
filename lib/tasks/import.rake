namespace :import do

  desc "Import categories from csv"
  task categories: :environment do
    counter = 0
    CSV.foreach("categories.csv", headers: true) do |row|
      category = Category.create(number: row[0], name: row[1])
      counter += 1 if category.persisted?
    end
    puts "Imported #{counter} categories"
  end

  desc "Import items from csv"
  task items: :environment do
    counter = 0
    (1..45).each do |f|
      CSV.foreach("goods/items_#{f}.csv", headers: true) do |row|
        item = Category.find_by(number: f).items.create(group_code: row[0], name: row[1])
        counter += 1 if item.persisted?
      end
      puts "Imported #{counter} items"
    end
  end
end