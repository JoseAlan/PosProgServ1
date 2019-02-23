class Api::V1::ProductsController < ApplicationController
	before_action :find_product, only: [:find, :update, :destroy]

	def hello_world
		render json: {message: 'Hello API'}
	end
	def list
		products = Product.all
		render json: products, status: :ok 
	end

	#create
	def create
		product = Product.new product_params
		#product.name = params[:name]
		#product.quantity = params[:quantity]

		if product.save
			render json: product, status: :created and return
		elsif product.has_nil_fields?
			error_status = :bad_request
		else	
			error_status = :unprocessable_entity
		end	

		render json: {message: 'Product not saved', errors: product.errors}, status: error_status
	end

	#delete
	def destroy
		#product = Product.find_by_id(params[:id])
		if @product.nil?
			render json: {message: "Product not found"}, status: :not_found
		else	
			@product.destroy
		end
	end

	def update
		#product = Product.find_by_id(params[:id])
		#@product.name = params[:name]
		#@product.quantity = params[:quantity]
		if @product.update (product_params)
			render json: @product, status: :ok and return
		elsif @product.has_nil_fields?
			error_status = :bad_request
		else	
			error_status = :unprocessable_entity
		end	

		render json: {message: 'Product not update', errors: @product.errors}, status: error_status

	end

	def find
		
		if @product.nil?
			render json: {message: "Product not found"}, status: :not_found
		else
			render json: @product, status: :ok 
		end

	end

	def product_params
		params.permit(:name, :quantity)
	end

	private
	def find_product
		@product = Product.find_by_id(params[:id])
	end	
end
