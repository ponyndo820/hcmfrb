print "Halo"
nama = "Heart candy"
umur = "17"
agama = "Islam"

puts "Halo sayang perkenalkan nama saya " + nama
puts "dan umur saya " + umur
puts "Agama saya " + agama

print "Apakah kamu ingin berteman dengan ku? (ya/tidak) :"
jawaban = gets.chomp
puts "Terkasih sudah menjawab pertanyaan itu #{jawaban}"

if jawaban == 'ya'
  puts "Senang sekali mendengarnya!"
elsif jawaban == 'tidak'
  puts "oh kenapa?"
  puts "Apakah Kamu tidak menyukai aku? :"
  alasan = gets.chomp
  puts "Baiklah, aku mengerti. Kamu sedang sibuk '#{alasan}'"
else
  puts "Senang sekali bertemu dengan mu!, Semoga kita bisa bertemu lagi."
end
