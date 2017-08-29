class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
validates :title, presence: true, length:{maximum:50}
validates :description, presence: true, length:{minimum:20}
before_save :set_visit_count
after_create :update_slug
before_update :assign_slug

has_attached_file :cover, styles: { medium: "900x800>", thumb: "600x500>" }, default_url: "/images/:style/missing.png"
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
def assign_slug
    self.slug = "#{ title.parameterize }"
end

def update_slug
    update_attributes slug: assign_slug
end
