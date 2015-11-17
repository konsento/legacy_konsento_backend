# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
user = User.create(username: "Ruiz", email: "email@email.com", password: "123456")

req =  RequirementValue.create(user: user, join_requirement_id: 1, value: 12345678900)

group = Group.create(parent_id: nil, title: "Global", description: "Global group.")

join = JoinRequirement.create(title: "CPF");

topic = Topic.create(user: user, group: group, title: "Sample Topic")
