# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

# Suppression de toutes les réservations existantes
Booking.destroy_all

# Suppression de toutes les îles existantes
Island.destroy_all

# Suppression de tous les utilisateurs existants
User.destroy_all

# Création de 10 utilisateurs avec des informations fictives
# Création de 10 utilisateurs avec des informations fictives
user1 = User.create!(email: 'user1@example.com', password: 'password123', first_name: 'John', last_name: 'Doe')
user2 = User.create!(email: 'user2@example.com', password: 'password123', first_name: 'Jane', last_name: 'Smith')
user3 = User.create!(email: 'user3@example.com', password: 'password123', first_name: 'Michael', last_name: 'Johnson')
user4 = User.create!(email: 'user4@example.com', password: 'password123', first_name: 'Emily', last_name: 'Williams')
user5 = User.create!(email: 'user5@example.com', password: 'password123', first_name: 'David', last_name: 'Brown')
user6 = User.create!(email: 'user6@example.com', password: 'password123', first_name: 'Olivia', last_name: 'Jones')
user7 = User.create!(email: 'user7@example.com', password: 'password123', first_name: 'Lucas', last_name: 'Garcia')
user8 = User.create!(email: 'user8@example.com', password: 'password123', first_name: 'Sophia', last_name: 'Martinez')
user9 = User.create!(email: 'user9@example.com', password: 'password123', first_name: 'Ethan', last_name: 'Davis')
user10 = User.create!(email: 'user10@example.com', password: 'password123', first_name: 'Ava', last_name: 'Rodriguez')

users = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10];
puts "Users seeded!"


# Seed des îles flottantes
islands = Island.create!([
  {
    name: "Île jungle sauvage",
    description: "Une île luxuriante peuplée de singes amicaux et d'une cascade portable.",
    location: "Amazonie flottante",
    price_per_night: 200.00,
    capacity: 10,
    gps_longitude: "-63.1316", # Coordonnée GPS choisie
    gps_latitude: "-3.4653",
    user: user2 # Remplacer user par users.sample
  },
  {
    name: "Île spa paradisiaque",
    description: "Jacuzzis, bains thermaux et massages en plein ciel.",
    location: "Ciel des Maldives",
    price_per_night: 450.00,
    capacity: 4,
    gps_longitude: "73.4249", # Coordonnée GPS choisie
    gps_latitude: "3.2028",
    user: user3 # Remplacer user par users.sample
  },
  {
    name: "Île volcanique",
    description: "Une île avec un volcan miniature actif pour un barbecue géant.",
    location: "Sous les cieux de l'Islande",
    price_per_night: 350.00,
    capacity: 8,
    gps_longitude: "-16.5225", # Coordonnée GPS choisie
    gps_latitude: "64.9630",
    user: user4 # Remplacer user par users.sample
  },
  {
    name: "Île disco",
    description: "Sol lumineux, musique funky et DJ inclus.",
    location: "La fête dans le ciel",
    price_per_night: 150.00,
    capacity: 20,
    gps_longitude: "74.0060", # Coordonnée GPS choisie
    gps_latitude: "40.7128",
    user: user5 # Remplacer user par users.sample
  },
  {
    name: "Île médiévale",
    description: "Un petit château, des chevaliers et un dragon de compagnie.",
    location: "Château flottant",
    price_per_night: 300.00,
    capacity: 6,
    gps_longitude: "4.8954", # Coordonnée GPS choisie
    gps_latitude: "52.3676",
    user: user6 # Remplacer user par users.sample
  },
  {
    name: "Île pirate",
    description: "Avec un coffre au trésor et des perroquets farceurs.",
    location: "Caribbean Sky",
    price_per_night: 250.00,
    capacity: 12,
    gps_longitude: "-81.2546", # Coordonnée GPS choisie
    gps_latitude: "18.2208",
    user: user7 # Remplacer user par users.sample
  },
  {
    name: "Île zen",
    description: "Jardin japonais flottant avec koi volants.",
    location: "Sérénité céleste",
    price_per_night: 400.00,
    capacity: 4,
    gps_longitude: "139.6917", # Coordonnée GPS choisie
    gps_latitude: "35.6895",
    user: user8 # Remplacer user par users.sample
  },
  {
    name: "Île des bonbons",
    description: "Entièrement faite de sucreries et friandises.",
    location: "Sugar Island",
    price_per_night: 120.00,
    capacity: 15,
    gps_longitude: "-0.1276", # Coordonnée GPS choisie
    gps_latitude: "51.5074",
    user: user9 # Remplacer user par users.sample
  },
  {
    name: "Île du désert",
    description: "Avec une oasis et des chameaux volants.",
    location: "Dune flottante",
    price_per_night: 180.00,
    capacity: 10,
    gps_longitude: "55.2708", # Coordonnée GPS choisie
    gps_latitude: "25.2048",
    user: user10 # Remplacer user par users.sample
  },
  {
    name: "Île glace et neige",
    description: "Igloos lumineux et toboggans de glace suspendus.",
    location: "Frozen Sky",
    price_per_night: 500.00,
    capacity: 5,
    gps_longitude: "-80.2207", # Coordonnée GPS choisie
    gps_latitude: "25.7617",
    user: user1 # Remplacer user par users.sample
  },
  {
    name: "Île jungle préhistorique",
    description: "Avec des dinosaures miniatures apprivoisés.",
    location: "Mesozoic Isle",
    price_per_night: 250.00,
    capacity: 10,
    gps_longitude: "19.4326", # Coordonnée GPS choisie
    gps_latitude: "99.1332",
    user: user2 # Remplacer user par users.sample
  },
  {
    name: "Île sous-marine flottante",
    description: "Avec une bulle transparente pour observer les poissons en volant.",
    location: "Atlantis flottant",
    price_per_night: 600.00,
    capacity: 3,
    gps_longitude: "-81.1631", # Coordonnée GPS choisie
    gps_latitude: "25.7743",
    user: user3 # Remplacer user par users.sample
  },
  {
    name: "Île carnaval",
    description: "Manèges, stand de pop-corn et jeux à gogo.",
    location: "Carnival in the Sky",
    price_per_night: 180.00,
    capacity: 15,
    gps_longitude: "2.3522", # Coordonnée GPS choisie
    gps_latitude: "48.8566",
    user: user4 # Remplacer user par users.sample
  },
  {
    name: "Île céleste mystique",
    description: "Ruines antiques flottantes et un ciel étoilé permanent.",
    location: "Mystic Cloud",
    price_per_night: 400.00,
    capacity: 6,
    gps_longitude: "25.276987", # Coordonnée GPS choisie
    gps_latitude: "55.296249",
    user: user5 # Remplacer user par users.sample
  },
  {
    name: "Île thématique géante",
    description: "Adaptée à vos envies, comme une île Harry Potter ou Star Wars.",
    location: "Fantasy Sky",
    price_per_night: 550.00,
    capacity: 20,
    gps_longitude: "3.1390", # Coordonnée GPS choisie
    gps_latitude: "101.6869",
    user: user6 # Remplacer user par users.sample
  }
])
puts "Islands seeded!"

file1 = URI.parse("https://i.postimg.cc/63HgQKSj/DALL-E-2024-11-18-11-34-41-A-lush-floating-jungle-island-with-vibrant-green-trees-a-cascading-wat.png").open
islands[0].photos.attach(io: file1, filename: "jungle_island.png", content_type: "image/png")
islands[0].save

file2 = URI.parse("https://i.postimg.cc/s24bt7JR/DALL-E-2024-11-18-11-34-54-A-serene-floating-spa-island-with-luxurious-jacuzzis-steaming-thermal.png").open
islands[1].photos.attach(io: file2, filename: "spa_island.png", content_type: "image/png")
islands[1].save

file3 = URI.parse("https://i.postimg.cc/xd2WxtMR/DALL-E-2024-11-18-11-34-58-A-dramatic-floating-volcanic-island-with-a-miniature-active-volcano-spe.png").open
islands[2].photos.attach(io: file3, filename: "volcanic_island.png", content_type: "image/png")
islands[2].save

file4 = URI.parse("https://i.postimg.cc/xCjBY8sN/DALL-E-2024-11-18-11-35-02-A-vibrant-floating-disco-island-with-a-glowing-multicolored-dance-floo.png").open
islands[3].photos.attach(io: file4, filename: "disco_island.png", content_type: "image/png")
islands[3].save

file5 = URI.parse("https://i.postimg.cc/d1SNYBkg/DALL-E-2024-11-18-11-35-04-A-whimsical-floating-medieval-island-featuring-a-small-stone-castle-wit.png").open
islands[4].photos.attach(io: file5, filename: "medieval_island.png", content_type: "image/png")
islands[4].save

file6 = URI.parse("https://i.postimg.cc/D08DJD32/DALL-E-2024-11-18-11-35-09-A-lively-floating-pirate-island-with-a-wooden-pirate-ship-docked-a-tre.png").open
islands[5].photos.attach(io: file6, filename: "pirate_island.png", content_type: "image/png")
islands[5].save

file7 = URI.parse("https://i.postimg.cc/bJ14RXjx/DALL-E-2024-11-20-15-16-29-A-majestic-floating-ice-kingdom-suspended-in-the-air-featuring-glowing.png").open
islands[9].photos.attach(io: file7, filename: "ice_island.png", content_type: "image/png")
file7_BIS = URI.parse("https://i.postimg.cc/MGMCvMPr/DALL-E-2024-11-20-15-16-26-A-whimsical-floating-winter-paradise-featuring-glowing-magical-igloos-s.png").open
islands[9].photos.attach(io: file7_BIS, filename: "ice_islandbBIS.png", content_type: "image/png")
file7_BISBIS = URI.parse("https://i.postimg.cc/RZDrSQRH/DALL-E-2024-11-20-15-16-20-A-whimsical-floating-winter-themed-island-featuring-glowing-igloos-made.png").open
islands[9].photos.attach(io: file7_BISBIS, filename: "ice_islandBISBIS.png", content_type: "image/png")
islands[9].save

file8 = URI.parse("https://i.postimg.cc/T24BMRnh/DALL-E-2024-11-18-11-35-13-A-tranquil-floating-Zen-island-featuring-a-beautifully-landscaped-Japan.png").open
islands[6].photos.attach(io: file8, filename: "zen_island.png", content_type: "image/png")
islands[6].save

file9 = URI.parse("https://i.postimg.cc/6qgPd0BC/DALL-E-2024-11-18-11-35-16-A-whimsical-floating-desert-island-with-golden-sand-dunes-a-shimmering.png").open
islands[8].photos.attach(io: file9, filename: "desert_island.png", content_type: "image/png")
islands[8].save

file10 = URI.parse("https://i.postimg.cc/RZgH1nWM/DALL-E-2024-11-20-16-09-43-A-whimsical-floating-island-made-entirely-of-sw-eets-and-candies-The-la.png").open
islands[7].photos.attach(io: file10, filename: "candy_island.png", content_type: "image/png")
islands[7].save

file11 = URI.parse("https://i.postimg.cc/kXRz7kys/DALL-E-2024-11-18-11-35-21-A-fantastical-floating-prehistoric-jungle-island-covered-in-dense-tropi.png").open
islands[10].photos.attach(io: file11, filename: "prehistoric_island.png", content_type: "image/png")
islands[10].save

file12 = URI.parse("https://i.postimg.cc/pLDSFz4n/DALL-E-2024-11-18-11-35-25-A-magical-floating-underwater-themed-island-encased-in-a-giant-transpar.png").open
islands[11].photos.attach(io: file12, filename: "underwater_island.png", content_type: "image/png")
islands[11].save

file13 = URI.parse("https://i.postimg.cc/N0DPNYgs/DALL-E-2024-11-18-11-35-28-A-vibrant-floating-carnival-island-featuring-colorful-carousels-roller.png").open
islands[12].photos.attach(io: file13, filename: "carnival_island.png", content_type: "image/png")
islands[12].save

file14 = URI.parse("https://i.postimg.cc/dQhwTNBk/DALL-E-2024-11-18-11-35-33-A-mystical-floating-island-with-ancient-ruins-including-large-crumblin.png").open
islands[13].photos.attach(io: file14, filename: "mystical_island.png", content_type: "image/png")
islands[13].save

file15 = URI.parse("https://i.postimg.cc/bJvVWMJQ/DALL-E-2024-11-18-11-35-41-A-floating-science-fiction-island-inspired-by-a-space-fantasy-featurin.png").open
islands[14].photos.attach(io: file15, filename: "scifi_island.png", content_type: "image/png")
islands[14].save

# Création de 2 à 3 réservations par utilisateur
users.each do |user|
  # Sélection de 2 à 3 îles aléatoires
  selected_islands = islands.sample(3)

  # Pour chaque île sélectionnée, créer une réservation
  selected_islands.each do |island|
    Booking.create!(
      start_date: Date.today + rand(1..10), # Date de début dans les 10 prochains jours
      end_date: Date.today + rand(11..20),   # Date de fin entre 11 et 20 jours après
      status: ["confirmed", "pending", "cancelled"].sample, # Statut aléatoire
      island: island,
      user: user
    )
  end
end
puts "Bookings created!"
