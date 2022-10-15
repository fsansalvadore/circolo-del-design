puts "\n==> Creating admin Users\n\n"

users = [
  {
    email: 'f.sansalavdore@gmail.com',
    password: '123123',
    admin: true
  },
  {
    email: 'info@circolodeldesign.it',
    password: '123123',
    admin: true
  }
]

# admins
users.map do |user|
  User.create_with(password: user['password'], admin: true).find_or_create_by(email: user["email"])
end

puts "\n==> Finished creating Users\n"
puts "\n===========================\n"
puts "\n==> Creating HomePage\n\n"

home_page = {
  title: "Home Page",
  subtitle: "Il Circolo del Design è uno spazio <strong>aperto</strong>, <strong>inclusivo</strong> e <strong>partecipato</strong>.",
  meta_title: "Circolo del Design — Home Page — Torino",
  meta_description: "Al Circolo del Design le aziende incontrano i professionisti, i progettisti si confrontano e si danno appuntamento, i ricercatori e gli studenti consultano la biblioteca e trovano un luogo in cui studiare e lavorare.",
  meta_keywords: "Circolo Del Design, Circolo, Torino, Design, eventi, mostre, workshop, progetti, partner, programma, aziende, studenti",
  heading: "Design<br/>as a<br/>multitude",
  hero_marquee_presence: true,
  hero_marquee_words: "PROCESSES, SIGHTS, RESEARCHES, OBSESSIONS, PASSIONS, CHANGES, IDEAS, MOVEMENTS",
  paragraph_1: "",
  cta_section_title: "",
  newsletter_box_text: "",
  paragraph_2: "",
  social_presence: true,
  column_1_title: "Programma Culturale",
  column_2_title: "Progetti d'Impatto",
  column_3_title: "Scopri il Circolo",
}

# Create or update Home Page
PageHome.find_or_create_by(title: "Home Page").update(home_page)

puts "\n==> Finished creating HomePage\n"
puts "\n===========================\n"
puts "\n==> Creating Global Settings\n\n"

global_settings = {
  site_title: "Circolo Del Design",
  main_email: "info",
  main_tel: "+39 331 432 1195",
  address: "Via San Francesco da Paola 17 - 10123 Torino TO Italia",
  opening_hours: "Da Lunedì a Venerdì / 14 – 19",
  meta_title: "Circolo del Design - Torino",
  meta_description:"Il Circolo del Design alimenta e promuove la cultura del progetto realizzando progetti d’impatto sul territorio e un programma di attività culturali e di formazione.",
  meta_keywords: "Circolo del Design, Torino",
  facebook_url: "https://www.facebook.com/circolodeldesign/",
  instagram_url: "https://www.instagram.com/circolodeldesign/",
  linkedin_url: "https://www.linkedin.com/company/circolo-del-design/",
  youtube_url: "https://www.youtube.com/channel/UCBYouoahfNG1qy-g4GIBQYg"
}

# Create or update Home Page
GlobalSetting.find_or_create_by(title: "Global Settings").update(global_settings)

puts "\n==> Finished creating Global Settings\n"
puts "\n======================================\n"