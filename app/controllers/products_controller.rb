class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @store = Store.find(params[:store_id])
    @products = @store.products
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @store = Store.find(params[:store_id])
  end

  # GET /products/new
  def new
    @store = Store.find(params[:store_id])
    
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    #1st you retrieve the store 
    @store = Store.find(params[:store_id])
    #2nd you retrieve the product.  This is def set_product
    # @product = Products.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to action: 'show', id: @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      # params[:product]
      params.require(:product).permit(:product_name, :product_description, :product_image, :product_price, :store_id, :category_id)
    end
end
