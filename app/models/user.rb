class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :authentication_keys => [:login]
# pour la validation des photo avec paperclip
has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


# pour la validations du pseudo obligatoire a l'inscription rapide

        # validates :pseudo, presence: true, uniqueness: true, format:{with: /\A[a-zA-Z0-9_]{2,20}\z/}

        # validates :email, uniqueness: true
        #connexion avec pseudo ou email

        validates :pseudo, presence: :true, uniqueness: { case_sensitive: false }
        #solutions 1
        validates_format_of :pseudo, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

        attr_writer :login

  def login
    @login || self.pseudo || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(pseudo) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:pseudo) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end






end
