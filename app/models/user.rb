class User < ActiveRecord::Base
    has_many :children
    before_destroy :ensure_not_referenced_by_any_child

    validates :email, :presence  => true, :uniqueness => true
    validates :password, :confirmation => true
    attr_accessor :password_confirmation
    attr_reader :password

    validate :password_must_be_present

    def User.authenticate(email,password)
        if user = find_by_email(email)
          if user.hashed_password == encrypt_password(password,user.salt)
            user
          end
        end
      end

    def User.encrypt_password(password, salt)
       Digest::SHA2.hexdigest(password + "wibble" + salt)
    end

    #to substitute the attr_accessor, which behind the scenes calls a reader and writer eg password=
    #since the method ends in an equals sign means that it can be assigned to. We want to implement
    #our own public method to have the writer to also create a new salt and set the hashed password

    def password=(password)
      @password = password
      if password.present?
        generate_salt
        self.hashed_password = self.class.encrypt_password(password,salt)
      end
    end

    private
      def ensure_not_referenced_by_any_child
         if children.empty?
           return true
         else
           errors.add(:base, 'This user is referenced by some children.')
           return false
         end
      end

      def password_must_be_present
        errors.add(:password, "Blank password")unless hashed_password.present?
      end

      def generate_salt
        self.salt = self.object_id.to_s + rand.to_s
      end
end
