class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :store
  has_many :images

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  has_attached_file :picture, :styles => { :show => "800x400>", :medium => "300x300>", :thumb => "175x175>" }, :default_url => "/images/:style/missing.png"

  # :storage => :s3,
  # :s3_credentials => {:bucket => ENV['AWS_BUCKET'],
  #                     :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
  #                     :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']},
  # :s3_protocol    => "https",
  # :s3_host_name   => "s3-us-west-2.amazonaws.com"


  private

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
  	if line_items.empty?
  		return true
  	else
  		errors.add(:base, 'Line Items present')
  		return false
  	end

  end
  

 #  validates :product_name, :product_description, :product_image, presence: true
 #  validates :product_price, numericality: {greater_than_or_equal_to: 0.01}
 #  validates :image_url, allow_blank: true, format: {
 #    with:    %r{\.(gif|jpg|png)\Z}i,
	# message: 'must be a URL for GIF, JPG or PNG image.' }
end
