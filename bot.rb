require 'telegram_bot'
token = '1458368015:AAHC0PybEcEPAlLh5TH1OxtilRNRZ1DJC4U'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /infos/i
      reply.text = "J'ai un secret à te confier,essaye d'utiliser l'autre commande."
    when /secret/i
      reply.text = "Salut, #{message.from.first_name}, t'es qu'un sale boucaque puant"
    else
      reply.text = "Hein,parle français sale gnoule."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
