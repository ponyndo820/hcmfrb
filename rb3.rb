require 'open-uri'

def ambil_screenshot(url, mode = "desktop")
  nama_file = "web_screenshot.png"
  
  # Menggunakan API dari Thum.io yang lebih handal untuk YouTube
  if mode == "mobile"
    api_url = "https://image.thum.io/get/iphone/#{url}"
  else
    api_url = "https://image.thum.io/get/width/1280/crop/800/#{url}"
  end

  puts "\n[+] Memproses render screenshot dari: #{url}..."

  begin
    URI.open(api_url, "User-Agent" => "Mozilla/5.0") do |gambar|
      File.open(nama_file, "wb") do |file|
        file.write(gambar.read)
      end
    end

    puts "[✓] Screenshot berhasil diunduh!"
    puts "=" * 45
    system("chafa #{nama_file}")

  rescue => e
    puts "[X] Gagal mengambil screenshot: #{e.message}"
  end
end

puts "=== GENERATOR SCREENSHOT WEB ==="
print "Masukkan URL Website: "
input_url = gets.chomp.strip 

# Memastikan URL memiliki https:// tanpa mengubah huruf kapital
unless input_url.match?(%r{\Ahttps?://}i)
  input_url = "https://" + input_url
end

print "Pilih Tampilan (1: Desktop, 2: Mobile) [1]: "
pilihan = gets.chomp.strip
mode_tampilan = (pilihan == "2") ? "mobile" : "desktop"

ambil_screenshot(input_url, mode_tampilan)
