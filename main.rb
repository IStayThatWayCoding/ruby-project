require 'discordrb'

config = File.foreach('config.txt').map { |line| line.split(' ').join(' ') }
bottoken = config[0].to_s
bot = Discordrb::Commands::CommandBot.new token: "#{bottoken}", client_id: "#{config[1].to_s}", prefix: "#{config[2].to_s}"

bot.command :ping do |msg|
    msg.respond "pong!"
end

at_exit { bot.stop }
bot.run