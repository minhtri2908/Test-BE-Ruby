class Api::StudentScoresController < ApplicationController
    # GET /api/student_scores/lookup/:sbd
    def lookup
      student = StudentScore.find_by(sbd: params[:sbd])
      if student
        render json: student
      else
        render json: { error: 'Không tìm thấy SBD' }, status: :not_found
      end
    end

    # GET /api/student_scores/report?subject=toan
  def report
    subject = params[:subject]
    if StudentScore::SUBJECTS.include?(subject)
      render json: StudentScore.level_counts_for(subject)
    else
      render json: { error: "Môn không hợp lệ" }, status: :bad_request
    end
  end

  def statistics
    render json: StudentScore.all_subjects_level_statistics
  end

    # GET /api/student_scores/statistics        ← mới thêm
    # trả về thống kê 4 mức điểm cho TẤT CẢ các môn
  def statistics
    render json: StudentScore.all_subjects_level_statistics
  end

  # GET /api/student_scores/top_block_a
  def top_block_a
    students = StudentScore
                .where.not(toan: nil)
                .where.not(vat_li: nil)
                .where.not(hoa_hoc: nil)
                .select("*, (toan + vat_li + hoa_hoc) AS block_a_total")
                .order(Arel.sql("block_a_total DESC"))
                .limit(10)

    render json: students.as_json(methods: [], only: [
      :id, :sbd, :toan, :vat_li, :hoa_hoc, :block_a_total
    ])
  end
end
