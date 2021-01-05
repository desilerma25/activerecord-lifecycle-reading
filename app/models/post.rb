class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case #checks if title is title case (calls to private method below)

  before_validation :make_title_case # will make title case BEFORE validation occurs (calls to private method below)
  # using before_save will run this AFTER validation occurs

  before_save :email_author_about_post # will call to private method below to send email to author RE post being successfully saved

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end

  def email_author_about_post
  end
end
