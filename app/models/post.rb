class Post < ApplicationRecord
  validates_presence_of :title, :content
  has_rich_text :content
  has_many :comments, dependent: :destroy

  def blurb(num_words=50)
    content.to_plain_text.truncate(num_words)
  end
end
