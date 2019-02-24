class Api::V1::PiecesController < ApplicationController
	before_action :find_piece, only: [:show, :update, :destroy]

	def index
		pieces = Piece.all
		render json: pieces, status: :ok 
	end

	def piece_params
		params.permit(:number, :name)
	end	
	
	private 
	
	def find_piece
		@piece = Piece.where(params[:id])
	end

end
