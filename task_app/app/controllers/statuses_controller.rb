# frozen_string_literal: true

class StatusesController < ApplicationController
  def new
    @status = Status.new
  end
  # end def new

  def index
    @statuses = Status.all
    # @statuses = @statuses.sort_by(&:name)
  end
  # end def index

  def show
    @status = Status.find(params[:id])
  end
  # end def show

  def edit
    @status = Status.find(params[:id])
  end
  # end def edit

  def create
    @status = Status.new(params.require(:status).permit(:name, :isActive))
    puts @status
    if @status.save
      redirect_to statuses_path
    else
      render 'new'
    end
    # end if-else
  end
  # end def create

  def update
    @status = Status.find(params[:id])
    if @status.update(params.require(:status).permit(:name, :isActive))
      redirect_to statuses_path
    else
      render 'edit'
    end
    # end if-else
  end
  # end def update

  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    redirect_to statuses_path
  end
  # end def destroy
end
# end class
