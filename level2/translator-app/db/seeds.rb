require 'factory_bot_rails'

include FactoryBot::Syntax::Methods

%w(Urgent Secret Rigolo).each { |tag| Tag.create(name: tag) }

tags = Tag.all

50.times.each do |_|
  user = create(:user)
  20.times.each { |_| create(:message, user: user, tag: tags.sample) }
end
