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
# Create Users
50.times do |t|
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
50.times do |t|
  Category.create(name: Haikunator.haikunate(40))
end

# Create Bicycles
10000.times do |t|
  begin
    Bicycle.create(
      name: Haikunator.haikunate(40),
      description: Haikunator.haikunate(40, ' '),
      category: Category.find(rand(1..50)),
      user: User.find(t < 100 ? 1 : rand(1..50))
    )
  rescue ActiveRecord::RecordNotFound
    next
  end
end
