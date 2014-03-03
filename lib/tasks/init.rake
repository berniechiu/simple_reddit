namespace :db do
  desc "Fill database with initialized data"
  # Ensure that the Rake task has access to the local Rails environment.
  task init: :environment do
    populate_categories
  end
end

def populate_categories
  categories = %w[Gem News Tutorial Discussion]

  categories.each do |category|
    Category.create!(name: category)
  end
end