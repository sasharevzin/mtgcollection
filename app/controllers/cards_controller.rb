class CardsController < ApplicationController
  autocomplete :card, :name, :full => true
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  # GET /cards
  # GET /cards.json
  def index
    if params[:name]
    @cards = Card.order(:name).where("name like '%#{params[:name]}%'").limit(1000)
    render html: @cards.map(&:name)
    else
      @cards = Card.first
    end
    #json: @cards.map(&:name)
  end

  # GET /cards/1
  # GET /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
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
