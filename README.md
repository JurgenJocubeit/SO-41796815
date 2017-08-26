# README

This project provides code to answer the StackOverflow question [Rails 5 - Multiple Foreign keys belongs to the same table](https://stackoverflow.com/questions/41796815/rails-5-multiple-foreign-keys-belongs-to-the-same-table/45893972#45893972).

To use this code clone the repo, switch to the project directory and execute the following:

```
rails db:create
rails db:migrate
rails db:seed
```

The project is currently setup to use sqlite3, but it will work the same in postgresql or mysql. Just change the `database.yml` and database driver gem in the `Gemfile`.

This will populate the database with three records, one order and two stations.

You can then interrogate the database using the rails console:

```
rails console

irb(main):001:0> pp Station.all

Station Load (0.3ms)  SELECT "stations".* FROM "stations"
[#<LoadingStation:0x007fcb8ac39440
  id: 1,
  comp_name1: "Loading Station 1",
  street: "Park Ave",
  street_num: "300",
  zip_code: "10001",
  city: "NY",
  type: "LoadingStation",
  created_at: Sat, 26 Aug 2017 09:06:53 UTC +00:00,
  updated_at: Sat, 26 Aug 2017 09:06:53 UTC +00:00>,
 #<UnloadingStation:0x007fcb8ac39288
  id: 2,
  comp_name1: "Unloading Station 4",
  street: "Madison Ave",
  street_num: "204",
  zip_code: "10001",
  city: "NY",
  type: "UnloadingStation",
  created_at: Sat, 26 Aug 2017 09:06:53 UTC +00:00,
  updated_at: Sat, 26 Aug 2017 09:06:53 UTC +00:00>]

irb(main):002:0> pp Order.all

Order Load (0.2ms)  SELECT "orders".* FROM "orders"
[#<Order:0x007fcb8bca2700
  id: 1,
  loading_station_id: 1,
  unloading_station_id: 2,
  status: "delivered">]

irb(main):003:0> order = Order.first

Order Load (0.2ms)  SELECT  "orders".* FROM "orders" ORDER BY "orders"."id" ASC LIMIT ?  [["LIMIT", 1]]
=> #<Order id: 1, loading_station_id: 1, unloading_station_id: 2, status:  "delivered">

irb(main):004:0> pp order.loading_station

LoadingStation Load (0.2ms)  SELECT  "stations".* FROM "stations" WHERE "stations"."type" IN ('LoadingStation') AND "stations"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
#<LoadingStation:0x007fcb8c0e4390
 id: 1,
 comp_name1: "Loading Station 1",
 street: "Park Ave",
 street_num: "300",
 zip_code: "10001",
 city: "NY",
 type: "LoadingStation",
 created_at: Sat, 26 Aug 2017 09:06:53 UTC +00:00,
 updated_at: Sat, 26 Aug 2017 09:06:53 UTC +00:00>

irb(main):005:0> pp order.unloading_station

UnloadingStation Load (0.3ms)  SELECT  "stations".* FROM "stations" WHERE "stations"."type" IN ('UnloadingStation') AND "stations"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
#<UnloadingStation:0x007fcb8a36a378
 id: 2,
 comp_name1: "Unloading Station 4",
 street: "Madison Ave",
 street_num: "204",
 zip_code: "10001",
 city: "NY",
 type: "UnloadingStation",
 created_at: Sat, 26 Aug 2017 09:06:53 UTC +00:00,
 updated_at: Sat, 26 Aug 2017 09:06:53 UTC +00:00>

irb(main):006:0> pp order.status

"delivered"
```
