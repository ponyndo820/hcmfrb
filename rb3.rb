require 'open-uri'
require 'cgi'

def ambil_screenshot(url, mode = "desktop")
  # Pengaturan resolusi layar
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
    
    # Menampilkan gambar di log Termux
    system("chafa #{nama_file}")

  rescue => e
    puts "[X] Gagal mengambil screenshot: #{e.message}"
  end
end

# --- Alur Interaktif ---
puts "=== GENERATOR SCREENSHOT WEB ==="
print "Masukkan URL Website (contoh: github.com): "
input_url = gets.chomp.downcase

# Otomatis menambahkan 'https://' jika belum ada
unless input_url.start_with?("http://", "https://")
  input_url = "https://" + input_url
end

print "Pilih Tampilan (1: Desktop, 2: Mobile) [1]: "
pilihan = gets.chomp

mode_tampilan = (pilihan == "2") ? "mobile" : "desktop"

# Panggil fungsi
ambil_screenshot(input_url, mode_tampilan)
