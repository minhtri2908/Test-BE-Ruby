class CreateStudentScores < ActiveRecord::Migration[8.0]
  def change
    create_table :student_scores do |t|
      t.string :sbd
      t.float :toan
      t.float :ngu_van
      t.float :ngoai_ngu
      t.float :vat_li
      t.float :hoa_hoc
      t.float :sinh_hoc
      t.float :lich_su
      t.float :dia_li
      t.float :gdcd
      t.string :ma_ngoai_ngu

      t.timestamps
    end
  end
end
