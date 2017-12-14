class Seed

  def self.begin
    seed = Seed.new
    seed.generate_messages
  end

  def generate_messages
    Message.destroy_all
    20.times do
      message = Message.create!(
      author: Faker::RickAndMorty.character
      content: Faker::RickAndMorty.quote
      )
    end
  end
end

Seed.begin
