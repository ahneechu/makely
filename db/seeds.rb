# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cause.destroy_all

cw = Cause.create(cause_name: 'Women')
cc = Cause.create(cause_name: 'Children')
ced = Cause.create(cause_name: 'Education')
cj = Cause.create(cause_name: 'Job Creation')
ch = Cause.create(cause_name: 'Health')
cen = Cause.create(cause_name: 'Environment')
cd = Cause.create(cause_name: 'Disaster Relief')
