# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
ruiz = User.new
ruiz.username = "Ruiz"
ruiz.email = "email@email.com"
ruiz.password = "123456"
ruiz.save
