class StudentScore < ApplicationRecord
  SUBJECTS = %w[
    toan ngu_van ngoai_ngu vat_li hoa_hoc
    sinh_hoc lich_su dia_li gdcd
  ].freeze

  validates :sbd, presence: true, uniqueness: true

  SUBJECTS.each do |sub|
    validates sub, numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 10
    }, allow_nil: true
  end

  def self.level_counts_for(subject)
    raise ArgumentError, "Invalid subject" unless SUBJECTS.include?(subject)

    grouped = StudentScore
                .where.not(subject => nil)
                .group(
                    Arel.sql("CASE
                                WHEN #{subject} >= 8 THEN '>=8'
                                WHEN #{subject} >= 6 THEN '6-8'
                                WHEN #{subject} >= 4 THEN '4-6'
                                ELSE '<4' END")
                )
                .count

    { '>=8': 0, '6-8': 0, '4-6': 0, '<4': 0 }.merge(grouped.transform_keys(&:to_sym))
  end

  def self.all_subjects_level_statistics
    results = {}
    SUBJECTS.each do |subj|
      results[subj] = level_counts_for(subj)
    end
    results
  end
end
