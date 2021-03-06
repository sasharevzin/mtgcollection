class CardsController < ApplicationController
  autocomplete :card, :name, :full => true
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.order(:name).limit(10)
    @cards.where!("name like '%#{params[:name]}%'") if params[:name]
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
    @card = Card.find(params[:id])
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /search
  def search
    @cards = Card.order(:name).limit(10)
    @cards.where!("name like '%#{params[:name]}%'") if params[:name]
  end

  # POST /cards
  # POST /cards.json



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.fetch(:card, {})
    end
end
