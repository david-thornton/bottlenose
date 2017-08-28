class ReviewFeedback < ApplicationRecord
  belongs_to :grade
  belongs_to :submission
  belongs_to :review_submission, class_name: "Submission"
  belongs_to :upload

  def censored
    (self.score / self.out_of) < self.grader.review_threshold.to_f / 100.0
  end

  def to_s
    "Submission #{submission_id} is reviewed by submission #{review_submission_id}"
  end
end