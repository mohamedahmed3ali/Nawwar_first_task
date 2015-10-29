class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
 	 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   # performs the many to many association between the users and themselves through frienships model
 	 has_many :friendships, :foreign_key => :user1_id, :dependent => :destroy

 	 has_many(:delete_frienship, :class_name => :Frienship,
      :foreign_key => :post_b_id, :dependent => :destroy)
  
  	has_many :friends, :class_name => :User, :through => :friendships, :source => :user2

    # end of association between users and themselves

    # allow the user to have an image using Avatar uploader
    mount_uploader :image, AvatarUploader 

    # performs many to many association between users and groups
    has_and_belongs_to_many :groups
    # end of the association betwen users and groups

    # signup validations

    validates_presence_of :username , :message => "Field Cannot be blank"
    validates_length_of :username , :maximum => 12 , :message => "Is Too Long(maximum is 12 characters)"  
    validates :username ,:allow_blank => true ,:uniqueness => {:message => "is Already Chosen"}

    # validates :password , :presence => { :message => "Field Can't Be Blank"} , :on => :create 
    validates :password , :allow_blank => true , :length => { :maximum => 12 , :message => "Is Too Long(maximum is 12 characters)"} 
    validates :password , :allow_blank => true , :length => { :minimum => 6, :message => "Is Too SHORT(minimum is 6 characters)"} 
    validates_confirmation_of :password, {:message => "These passwords don't match."}

     validates :email, format: { with: /\A[^@\s]+@(nawwar+\.)+[com]+\z/, message: "must be with this format: example@nawwar.com" }
    # validates :email ,:presence => {:message => "Can't Be Blank"} , :on => :create
    validates :email ,:allow_blank => true ,:uniqueness => {:message => "Already Registerd"}
    validates_confirmation_of :email, {:message => "Please , Re-enter Your Email"}
    # end of signup validations 
    scope :sorted, lambda { order("users.id DESC")}


end
