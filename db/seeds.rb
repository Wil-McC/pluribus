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
basel.artifacts.create(name: "Unterwasser Blau", rare: false, age: 76)
basel.artifacts.create(name: "Amberzauber Sieben", rare: false, age: 250)

demet.artifacts.create(name: "Astrava", rare: false, age: 28)
demet.artifacts.create(name: "Octavion", rare: true, age: 48)
demet.artifacts.create(name: "Summerbless", rare: true, age: 150)

forte.artifacts.create(name: "Luvi", rare: false, age: 16)
forte.artifacts.create(name: "Piccolo V", rare: true, age: 214)
forte.artifacts.create(name: "Albanaii", rare: false, age: 46)

sommel.artifacts.create(name: "Xtreem", rare: false, age: 22)
sommel.artifacts.create(name: "Phineastris", rare: true, age: 845)
sommel.artifacts.create(name: "Anthobloc", rare: false, age: 54)

camber.artifacts.create(name: "Aloysious II", rare: false, age: 125)
camber.artifacts.create(name: "Timicken", rare: false, age: 62)
camber.artifacts.create(name: "Phantasmicit L2", rare: false, age: 125)

chengdu.artifacts.create(name: "Taotie", rare: true, age: 3200)
chengdu.artifacts.create(name: "QinZiFeng", rare: true, age: 2500)
chengdu.artifacts.create(name: "MingTuXiaoXiang", rare: true, age: 1256)
