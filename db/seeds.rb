# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

loading_station_1 = LoadingStation.create!(
  comp_name1: "Loading Station 1",
  street: "Park Ave",
  street_num: "300",
  zip_code: 10001,
  city: "NY"
)

unloading_station_4 = UnloadingStation.create!(
  comp_name1: "Unloading Station 4",
  street: "Madison Ave",
  street_num: "204",
  zip_code: 10001,
  city: "NY"
)

Order.create!(
  loading_station: loading_station_1,
  unloading_station: unloading_station_4,
  status: "delivered"
)
