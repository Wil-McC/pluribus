# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Artifact.destroy_all
Museum.destroy_all

basel = Museum.create!(name: "ArtBasel", open: true, cost: 18)
demet = Museum.create!(name: "Demetera", open: true, cost: 4)
forte = Museum.create!(name: "ItaliForte", open: false, cost: 8)
sommel = Museum.create!(name: "Sommelitsch", open: false, cost: 12)
camber = Museum.create!(name: "CamberMass", open: true, cost: 6)
chengdu = Museum.create!(name: "YiShu Chengdu", open: true, cost: 0)

basel.artifacts.create(name: "Die Welt", rare: true, age: 230)
basel.artifacts.create(name: "Die Welt", rare: true, age: 230)
