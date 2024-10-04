class Task < ApplicationRecord
  enum status: { todo: 0, doing: 1, done: 2 }
  validates :title, presence: true #デフォルトのエラーメッセージとして"〇〇 can't be blank"を生成
  validates :status, presence: true
  validates :deadline, presence: true
  validate :deadline, :must_start_from_today

  def must_start_from_today
    errors.add(:deadline, 'must start from today') if deadline.present? && deadline < Date.current
  end
end
