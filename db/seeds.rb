# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cause.destroy_all
Category.destroy_all

cw = Cause.create(cause_name: 'Women')
cc = Cause.create(cause_name: 'Children')
ced = Cause.create(cause_name: 'Education')
cj = Cause.create(cause_name: 'Job Creation')
ch = Cause.create(cause_name: 'Health')
cen = Cause.create(cause_name: 'Environment')
cd = Cause.create(cause_name: 'Disaster Relief')


catm = Category.create(category_name: 'Men')
catw = Category.create(category_name: 'Women')
catk = Category.create(category_name: 'Kids')
cath = Category.create(category_name: 'Home & Living')
cata = Category.create(category_name: 'Accessories')
catj = Category.create(category_name: 'Jewelery')
catg = Category.create(category_name: 'Gift Ideas')
