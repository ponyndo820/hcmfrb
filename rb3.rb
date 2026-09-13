require 'open-uri'
require 'cgi'

def ambil_screenshot(url, mode = "desktop")
  resolusi = mode == "mobile" ? "&viewport.width=375&viewport.height=812" : "&viewport.width=1280&viewport.height=800"
  
  nama_file = "web_screenshot.png"
  url_encoded = CGI.escape(url)
  api_url = "https://api.microlink.io/?url=#{url_encoded}&screenshot=true&embed=screenshot.url#{resolusi}"

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
# HAPUS .downcase di sini agar karakter huruf besar pada URL/ID YouTube tetap terjaga!
input_url = gets.chomp.strip 

# Pengecekan skema HTTP/HTTPS tanpa mengganggu huruf kapital di bagian ID
unless input_url.match?(%r{\Ahttps?://}i)
  input_url = "https://" + input_url
end

print "Pilih Tampilan (1: Desktop, 2: Mobile) [1]: "
pilihan = gets.chomp.strip

mode_tampilan = (pilihan == "2") ? "mobile" : "desktop"

ambil_screenshot(input_url, mode_tampilan)
