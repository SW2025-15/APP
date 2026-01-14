class User < ApplicationRecord
  # Devise設定
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  
  # 学籍番号は10桁
  validates :student_id, presence: true, uniqueness: true, length: { is: 10 }, format: { with: /\A\d+\z/ }

  # メールアドレスを不要にする
  #「保存する前に、学籍番号@example.com というメールアドレスを自動セットする」
  before_validation :set_dummy_email

  private
  def set_dummy_email
    self.email = "#{student_id}@example.com" if student_id.present?
  end
end