require 'digest/sha1'
class AdminUser < ActiveRecord::Base
  attr_accessor :password








  before_save :create_hashed_password
  after_save :clear_password

  attr_protected :hashed_password, :salt

  def self.authenticate(email="", password="")
    user = AdminUser.find_by_email(email)

    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  def password_match?(password="")
    hashed_password == AdminUser.hash_with_salt(password, salt)
  end


  def self.make_salt(email="")
    Digest::SHA1.hexdigest("swearwording #{email} sdfd312asdfbs12Ssd #{Time.now} bdigejdmg333d3dbwq122")
  end
  def self.hash_with_salt(hashed_password='', salt='')
    Digest::SHA1.hexdigest("agaeg22 #{salt} ogese53bdfb4s7b2d8n #{hashed_password}")
  end

  private

  def create_hashed_password
    unless password.blank?
      self.salt = AdminUser.make_salt(email) if salt.blank?
      self.hashed_password = AdminUser.hash_with_salt(password,salt)
    end
  end

  def clear_password
    self.password = nil
  end
end
