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
end