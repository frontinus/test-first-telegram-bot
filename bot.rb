require 'telegram_bot'
token = '1458368015:AAHC0PybEcEPAlLh5TH1OxtilRNRZ1DJC4U'
bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /Comment vas tu Papacito?/i
      reply.text = ""
    when /secret/i
      reply.text = "Salut, #{message.from.first_name}, t'es qu'un sale boucaque puant"
    when /montre moi une image?/i
      reply.text = ""
    when /montre moi une video?/i
      reply.text = ""
    when /raconte moi une connerie?/i
      reply.text = ""
    when /ecris moi des autisteries?/i
      reply.text = ""
    else
      reply.text = "Hein,parle français sale gnoule."
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
