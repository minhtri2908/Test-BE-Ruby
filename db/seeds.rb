# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

csv_path = Rails.root.join('lib', 'seeds', 'diem_thi_thpt_2024.csv')
batch_size = 10_000
rows = []

puts "📥 Bắt đầu import dữ liệu từ CSV..."

CSV.foreach(csv_path, headers: true).with_index(1) do |row, idx|
  rows << {
    sbd: row['sbd'],
    toan: row['toan'],
    ngu_van: row['ngu_van'],
    ngoai_ngu: row['ngoai_ngu'],
    vat_li: row['vat_li'],
    hoa_hoc: row['hoa_hoc'],
    sinh_hoc: row['sinh_hoc'],
    lich_su: row['lich_su'],
    dia_li: row['dia_li'],
    gdcd: row['gdcd'],
    ma_ngoai_ngu: row['ma_ngoai_ngu'],
    created_at: Time.current,
    updated_at: Time.current
  }

  if rows.size >= batch_size
    StudentScore.insert_all(rows)
    puts "✅ Đã insert batch #{idx / batch_size}"
    rows.clear
  end
end

# insert phần còn lại
StudentScore.insert_all(rows) unless rows.empty?

puts "🎉 Import hoàn tất!"
