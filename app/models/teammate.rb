require 'digest/sha2'
require 'app/models/cratepayer'

class Teammate < ActiveRecord::Base
  has_one :cratepayer

  validates :password, :confirmation => true
  attr_accessor :password_new, :password_confirmation
  attr_reader :password

  #validate :password_must_be_present

  def Teammate.authenticate(name, password)
    if cp = Cratepayer.find_by_name(name)
      if cp.teammate_id.nil? == false
        teammate = cp.teammate
        if teammate.salt && (teammate.hashed_password == encrypt_password(password, teammate.salt))
          return teammate
        else
          logger.info "Password '[FILTERED]' is not valid"
        end
      else
        logger.info "'#{name}' is not a teammate."
      end
    else
      logger.info "Could not find user '#{name}'"
    end

    return nil
  end

  def Teammate.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + 'wibble' + salt)
  end

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  def change_password(current, new, confirmation)
    successful = true

    if (self.hashed_password.nil? == false)
      if current.nil?
        successful = false
        errors.add(:password, I18n.translate('activerecord.errors.messages.blank'))
      elsif self.hashed_password != self.class.encrypt_password(current, self.salt)
        successful = false
        errors.add(:password, I18n.translate('activerecord.errors.messages.wrong'))
      end
    end

    if (new.length < 4)
      successful = false
      errors.add(:password_new, I18n.translate('activerecord.errors.messages.password_too_short'))
    end

    if (new != confirmation)
      successful = false
      errors.add(:password_confirmation, I18n.translate('activerecord.errors.messages.wrong'))
    end

    if successful
      self.password = new
      self.save
    end

    return successful
  end

  private

  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end
