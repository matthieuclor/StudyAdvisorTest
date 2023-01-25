# Ce fichier devra contenir votre système de traduction en langue PiouPiou.
# Veuillez vous assurer de tirer le meilleur profit de la programmation objet
# d'assurer une qualité de production
#
# Il sera exécuté de la façon suivante :
# ruby piou.rb encode '...'
# ruby piou.rb decode '...'

require 'getoptlong'
require './piou_translator/piou_translator'

opts = GetoptLong.new(['--help', '-h', GetoptLong::NO_ARGUMENT])

opts.each do |opt|
  case opt
  when '--help'
    puts <<-HELP
      -h, --help:
        show help

      encode:
        encode french to piou piou language

      decode:
        decode piou piou to french language
    HELP
  end
end

unless ARGV.length == 2
  puts 'Missing arguments (try --help)'
  exit 0
end

unless %w(encode decode).include?(ARGV[0])
  puts 'Missing available arguments (try --help)'
  exit 0
end

piou_translator = PiouTranslator.new(ARGV[1], ARGV[0])

puts piou_translator.result
