module Ckeditor
  class Page < ActiveRecord::Base

    attr_accessible :title, :content, :url

    has_and_belongs_to_many :users

    validates :name, :presence => true, :uniqueness => true

    def editable?(user)
      return false if user.nil?
      return true if user.admin?
      return true if users.include?(user)
      false
    end
  end
end