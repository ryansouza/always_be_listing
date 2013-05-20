class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /lists
  def index
    @lists = List.all

    respond_with({ lists: @lists })
  end

  # GET /lists/1
  def show
    respond_with({ list: @list })
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  def create
    @list = List.new(list_params)

    if @list.save
      respond_to do |t|
        t.html { redirect_to @list, notice: 'List was successfully created.' }
        t.json { respond_with({ list: @list }) }
      end
    else
      respond_to do |t|
        t.html { render action: 'new' }
        t.json { render json: { errors: @list.errors.full_messages }, status: 400 }
      end
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      respond_to do |t|
        t.html { redirect_to @list, notice: 'List was successfully updated.' }
        t.json { respond_with({ list: @list }) }
      end
    else
      respond_to do |t|
        t.html { render action: 'edit' }
        t.json { render json: { errors: @list.errors.full_messages }, status: 400 }
      end
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    respond_with do |t|
      t.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      t.json { render text: nil, status: 200 }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def list_params
      params.require(:list).permit(:name, :title)
    end
end
