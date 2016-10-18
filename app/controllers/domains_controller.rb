class DomainsController < ApplicationController
  def new
    @domain = Domain.new
    @domainn = Domain.last
    @record = @domainn.records.new
  end

  def create
    @domain = Domain.new(domain_params)
     
    if @domain.save
      redirect_to :back
    else
      render 'domains/new'
    end
  end

  def show
  end

  def search
    if params[:search].present?
      @domains = Domain.search(params[:search])
    else
      @domains = []
    end
  end

  def destroy
    set_domain
    @domain.destroy
    redirect_to root_path
  end

  def index
    @domains = Domain.all
  end
private

  def domain_params
    params.require(:domain).permit(:name)
  end

  def set_domain
    @domain = Domain.find(params[:id])
  end
end
