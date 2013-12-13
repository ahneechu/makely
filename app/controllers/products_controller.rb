class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /store/:store_id/products
  # GET /store/:store_id/products.json
  def index
    @store = Store.find(params[:store_id])
    @products = @store.products
  end

  def all_products
    @products = Product.all.order(:category_id)
  end

  # GET /store/:store_id/products/1
  # GET /store/:store_id/products/1.json
  def show
    # @cause = Cause.find(params[:cause_id])
    # @category = Category.find(params[:category_id])

    # @image = @product.images.find(product)
  end

  # GET /store/:store_id/products/new
  def new
    store = Store.find(params[:store_id])
    @product = store.products.build
  end

  # GET /store/:store_id/products/1/edit
  def edit
  end

  # POST /store/:store_id/products
  # POST /store/:store_id/products.json
  def create
    # logger.info params[:images][:direct_upload_url]
    # store = Store.find(params[:store_id])
    # @product = store.products.create(product_params)
    # @image = @product.images.create!(image_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to([@product.store, @product], notice: 'Product was successfully created.') }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store/:store_id/products/1
  # PATCH/PUT /store/:store_id/products/1.json
  def update
    # store = Store.find(params[:store_id])
    # @product = store.products.create(product_params)
    # @image = @product.images.create!(image_params)
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to([@product.store, @product], notice: 'Product was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store/:store_id/products/1
  # DELETE /store/:store_id/products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to store_products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      #1st you retrieve the store 
      @store = Store.find(params[:store_id])
      #2nd you retrieve the product.  
      @product = @store.products.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      # params[:product]
      params.require(:product).permit(:product_name, :product_description, :product_price, :store_id, :category_id)
    end

    # def image_params
    #     params.require(:image).permit(:direct_upload_url)
    # end

end
