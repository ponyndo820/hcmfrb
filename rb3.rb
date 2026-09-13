require 'open-uri'

# 1. URL Gambar yang ingin diunduh
url_gambar = "https://youtu.be/3RZ6Eir-QyI?si=c4EG74yYtoR_Fuoa"
nama_file = "logo_ruby.png"

puts "Sedang mengunduh gambar..."

# 2. Proses mengunduh gambar
URI.open(url_gambar) do |gambar|
  File.open(nama_file, "wb") do |file|
    file.write(gambar.read)
  end
end

puts "Gambar berhasil diunduh!"
puts "=" * 40
puts "Tampilan gambar di log terminal:"
puts "=" * 40

# 3. Memanggil perintah terminal 'chafa' melalui Ruby
system("chafa #{nama_file}")
