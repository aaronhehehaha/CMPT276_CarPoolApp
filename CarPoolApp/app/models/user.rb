class User < ActiveRecord::Base
  acts_as_messageable
  attr_accessor :activation_token, :reset_token
  before_create :create_activation_digest


  before_save {self.email = email.downcase}
  validates :firstname, presence: true, length: { maximum: 50}
  validates :lastname, presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,:format => /@sfu.ca/, presence: true, length: { maximum: 255},
  uniqueness: { case_sensitive: false}
  has_secure_password
    validates :password, presence:true, length: { minimum: 6}, allow_nil: true

    def mailboxer_email(object)
      email
    end
    
    def authenticated?(attribute, token)
      digest = send("#{attribute}_digest")
      #return false if digest.nil?
    #  BCrypt::Password.new(digest).is_password?(token)
    end

    def User.digest(string)
       cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                     BCrypt::Engine.cost
       BCrypt::Password.create(string, cost: cost)
     end

    def User.new_token
      SecureRandom.urlsafe_base64
    end

    def activate
      update_attribute(:activated, true)
      update_attribute(:activated_at, Time.zone.now)
    end

    def send_activation_email
      UserMailer.account_activation(self).deliver_now
    end

    def create_reset_digest
      self.reset_token = User.new_token
      update_attribute(:reset_digest,  User.digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)
    end

    def send_password_reset_email
      UserMailer.password_reset(self).deliver_now
    end

    def password_reset_expired?
      reset_sent_at < 2.hours.ago
    end


    private

    def downcase_email
      self.email =email.downcase
    end

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
