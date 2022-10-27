class IntrosController < ApplicationController
  before_action :set_intro, only: %i[ show update destroy ]

  def me
    render json: { slackUsername: "Sodiq", backend: true, age: 25, bio: "Hi, I'm Sodiq. A full-stack software engineer and soft life advocate. My goal is to build products that improve the lives of people around the world." }
  end
  # GET /intros
  def index
    @intros = Intro.all

    render json: @intros
  end

  # GET /intros/1
  def show
    render json: @intro
  end

  # POST /intros
  def create
    @intro = Intro.new(intro_params)

    if @intro.save
      render json: @intro, status: :created, location: @intro
    else
      render json: @intro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /intros/1
  def update
    if @intro.update(intro_params)
      render json: @intro
    else
      render json: @intro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /intros/1
  def destroy
    @intro.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intro
      @intro = Intro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intro_params
      params.require(:intro).permit(:slack_username, :backend, :age, :bio)
    end
end
