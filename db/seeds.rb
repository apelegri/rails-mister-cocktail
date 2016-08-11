Cocktail.destroy_all
attributes = [
  {
    name: "Mojito",
    # doses: "6",
    # ingredients: 'mint'
  },
  {
    name: "Vodka Martini",
    # doses: "6",
    # ingredients: "alcool"
  }
]
attributes.each do |attribute|
  Cocktail.create!(attribute)
end
