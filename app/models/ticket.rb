class Ticket < ApplicationRecord
  validates_presence_of :subject, :description, :client_number
  belongs_to :user
  has_many :reply, class_name: Ticket, foreign_key: :parent_id

  enum status: %i[Open InProgress Resolved Closed]

  before_validation :set_user_id, on: :create
  validates_uniqueness_of :number, allow_blank: true

  after_create :generate_number, if: Proc.new { |ticket| ticket.parent_id.nil? }

  scope :by_keyword, ->(keyword) {
    where(["LOWER(subject) LIKE :keyword OR LOWER(number) LIKE :keyword", { keyword: "%#{keyword.downcase}%" }]) if keyword.present?
  }

  scope :original, ->{ where(parent_id: nil)}

  scope :open, -> { where(status: [:Open, :InProgress])}
  scope :resolved, -> { where(status: [:Resolved, :Closed])}

  def ticket_status
   status.tableize.singularize.titleize
  end

  def created_info
   [created_at.strftime("%Y-%m-%d %H:%M:%S"), [ user.first_name, user.last_name ].reject(&:blank?).join(" ") ].join(" | ")
  end

  private

    def generate_number
      loop do
        number = 10.times.map{ Random.rand(9) }.join
        status = self.update(number: number) rescue false
        break if status
      end
    end

    def set_user_id
      self.user_id ||= Current.user.id
    end
end
