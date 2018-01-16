namespace :dev do
  desc "TODO"
  puts "Inicia setup da api"
  
  task setup: :environment do
    puts "Zerando banco..."
    %x(rails db:drop db:create db:migrate)
    puts "Banco zero km!"
    
    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind| 
      Kind.create!(
        description: kind
      )
    end

    20.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.years.ago, 18.years.ago),
        kind: Kind.all.sample 
      )
    end

    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        contact.phones.build(number: Faker::PhoneNumber.cell_phone)
        contact.save!
      end
    end
    
  puts "Setup finalizado com sucesso"
  end
end
