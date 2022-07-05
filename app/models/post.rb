class Post < ApplicationRecord
  validates_presence_of :title, :content
  has_rich_text :content
  has_many :comments, dependent: :destroy
  
  # https://github.com/pat/gutentag/wiki/Examples#adding-to-a-model
  Gutentag::ActiveRecord.call self
  def tags_as_string
    # NOTE: now we have the tag_names attr accessor
    tag_names.join(', ')
  end

  def tags_as_string=(string)
    self.tag_names = string.split(/,\s*/)
  end 

  def blurb(num_words=50)
    content.to_plain_text.truncate(num_words)
  end
end
