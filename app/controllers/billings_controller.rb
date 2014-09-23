class BillingsController < ApplicationController
	include ApplicationHelper

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
		@billing = Billing.find(params[:id])
	end

	def edit
		@billing = Billing.find(params[:id])
	end

	def update
	  @billing = Billing.find(params[:id])
    if @billing.update_attributes(billing_params)
      flash[:notice] = "Billing updated"
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


	def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

	private
		def billing_params
			params.require(:billing).permit(:name, :description, :value, :status,
																		 debts_attributes: [:debtor_id, :value, :_destroy, :status])
		end
end