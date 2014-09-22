class BillingsController < ApplicationController

	def index
		@billings = current_user.billings
	end

	def new
		@billing = Billing.new
	end

	def create
		@billing = current_user.billings.new(billing_params)
		if @billing.save
			flash[:notice] = "Bill successfully created"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@billing = current_user.billings.find(params[:id])
	end

	def edit
		@billing = Billing.find(params[:id])
	end

	def update
	  @billing = Billing.find(params[:id])
    if @billing.update_attributes(params[billing_params])
      flash[:success] = "Billing updated"
      redirect_to billing_path(@billing)
    else
      render 'edit'
    end
	end

  def destroy
    Billing.find(params[:id]).destroy
    flash[:success] = "Billing deleted"
    redirect_to billings_path
  end


	private
		def billing_params
			params.require(:billing).permit(:name, :description, :value, :status,
																		 debts_attributes: [:debtor_id, :value, :_destroy, :status])
		end
end