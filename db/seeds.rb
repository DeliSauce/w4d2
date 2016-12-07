
Cat.delete_all
henry = Cat.create(name: "Henry", birth_date: "2016-01-01", color: "Black", sex: "M", description: "Cuddly and sweet!")

norton = Cat.create(name: "Norton", birth_date: "2012-11-11", color: "White", sex: "F", description: "Regal. Likes tummy rubs.")


CatRentalRequest.delete_all

rent1 = CatRentalRequest.create(cat_id: 1, start_date: "2016-12-01", end_date: "2016-12-02", status: "APPROVED")

rent2 = CatRentalRequest.create(cat_id: 1, start_date: "2016-12-04", end_date: "2016-12-05", status: "APPROVED")

rent3 = CatRentalRequest.create(cat_id: 2, start_date: "2016-12-02", end_date: "2016-12-02", status: "APPROVED")
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
