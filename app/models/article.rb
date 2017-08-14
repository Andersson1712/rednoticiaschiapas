class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
validates :title, presence: true, length:{maximum:50}
validates :description, presence: true, length:{minimum:20}
before_save :set_visit_count

has_attached_file :cover, styles: { medium: "1280x720>", thumb: "900x300>" }, default_url: "/images/:style/missing.png"
validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

scope :ultimos, ->{order("created_at DESC").limit(6)}
def update_visit_count
    self.save if self.visit_count.nil?
    self.update(visit_count: self.visit_count + 1)
end
private

def set_visit_count
  self.visit_count ||= 0
end
end
