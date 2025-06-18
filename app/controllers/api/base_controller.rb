class Api::BaseController < ApplicationController
  def index
    render json: {
      message: "✅ Welcome to the THPT 2024 API. Use /api/student_scores/:sbd to search score by ID or /api/student_scores/top_block_a for top Group A scores."
    }
  end
end
