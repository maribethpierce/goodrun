class User < ActiveRecord::Base
  belongs_to :research_group
  has_one :company
  has_many :companies through: :research_groups
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, inclusion: { in: %w("male", "female") }, if: super_star?
  validates :age, presence: true, if: super_star?
  validates :birth_month, presence: true, if: super_star?
  validates :birth_month, inclusion: { in: %w("January","February","March","April",
                                    "May","June","July","August","September","October",
                                    "November","December") }, if: super_star?
  validates :relationship_status, if: super_star?
  validates :relationship_status, inclusion: { in: %w("Single","Long-Term Relationship",
                                            "Married","Separated","Divorced",
                                            "Widowed") }, if: super_star?
  validates :race, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, if: super_star?
  validates :anual_income, presence: true, if: super_star?
  validates :anual_income, inclusion: { in: %w("Under $30,000","$30,000-$49,999","$50,000-$74,999",
                                      "$75,000-$99,000","$100,000+") }
  validates :children, presence: true, if: super_star?
  validates :children, inclusion: { in: ("0","1","2","3","4","5","6+") }
  validates :kid_ages, presence: true, if: :children?
  validates :twins, inclusion: { in: %w(true,false)}
  validates :education, presence: true, if: super_star?
  validates :education, inclusion: { in: %w("Some High School","High School Graduate",
                                    "Some College","2-Year College Graduate",
                                    "4-Year College Graduate","Post Graduate Degree") }
  validates :career, presence: true, if: super_star?
  validates :career, length: { maximum: 30, too_long: "%{count} characters is the maximum allowed" }
  validates :employer, length: { maximum: 50, too_long: "%{count} characters is the maximum allowed" }
  validates :phone, presence: true, if: super_star?
  validates :phone, numericality: true
  validates :alt_phone, presence: true, if: super_star?
  validates :alt_phone, numericality: true
  validates :zip, presence: true, if: super_star?
  validates :zip, numericality: { only_integer: true }, length: { is: 5 }
  validates :closest_city, presence: true, if: super_star?
  validates :closest_city, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
  validates :referral, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }

  def admin?
    admin
  end

  def company_user?
    company_user
  end

  def children?
    children.length > 0 && children[0] != "0"
  end

end
