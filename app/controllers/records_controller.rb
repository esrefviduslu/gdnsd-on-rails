class RecordsController < ApplicationController

  def create
    @domain = Domain.find(params[:domain_id])
    @record = @domain.records.new(record_params)
    if @comment.save
      redirect_to domain_path(@domain)
    end
  end

  def destroy
    @domain = Domain.find(params[:domain_id])
    @record = @domain.records.find(params[:id])
    @record.destroy
    redirect_to domain_path(@domain)
  end

private

  def record_params
    params.require(:record).permit(:domain_id,:name,:record_type,:content,:ttl,:prio)
  end
end
