# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  [
    {
      email: 'pierre@michaux.com',
      password: 'progenitor'
    }
  ]
)

USER_COUNTT = 20
CATEGORIES_COUNT = 25
BICYCLE_COUNT = 300

# Create Users
USER_COUNTT.times do |t|
  begin
    User.create(
      email: Haikunator.haikunate(0, '') + '@example.com',
      password: Haikunator.haikunate(0, '')
    )
  rescue ActiveRecord::RecordInvalid
    next
  end
end

# Create Categories
CATEGORIES_COUNT.times do |t|
  Category.create(name: Haikunator.haikunate(40))
end

file = File.open(Rails.root + "db/seeds_images/test.jpg")
# Create Bicycles
BICYCLE_COUNT.times do |t|
  puts "Create #{t}"
  begin
    Bicycle.create(
      image: file,
      name: Haikunator.haikunate(40),
      description: Haikunator.haikunate(40, ' '),
      category: Category.find(rand(1..CATEGORIES_COUNT)),
      user: User.find(t < 30 ? 1 : rand(1..USER_COUNTT))
    )
  rescue ActiveRecord::RecordNotFound
    next
  end
end

file.close
