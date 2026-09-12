print "Halo"
nama = "Heart candy"
umur = "17"
agama = "Islam"

puts "Halo sayang perkenalkan nama saya " + nama
puts "dan umur saya " + umur
puts "Agama saya " + agama 
puts "\n\n"
print "Apakah kamu ingin berteman dengan ku? : "
jawaban = gets.chomp
puts "Terkasih sudah menjawab #{jawaban}"

if jawaban == 'ya'
  puts "Senang sekali mendengarnya!"
elsif jawaban == 'tidak'
  puts "oh kenapa?"
  puts "Apakah Kamu tidak menyukai aku? :"
  alasan = gets.chomp
  puts "Baiklah, aku mengerti."
else
  puts "Senang sekali bertemu dengan mu!, Semoga kita bisa bertemu lagi."
end
