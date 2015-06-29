class CostsController < ApplicationController

def index
@user = current_user
 @costs = @user.costs
end

def show
	@user = current_user
	@cost = @user.cost(params[:id])
end

def new
	@user = current_user
	@costs = current_user.costs.new
end

def create
	@user = current_user
	@cost = @user.costs.new(cost_params)

	if @cost.save
		redirect_to user_costs_path
	else
	render 'new'
	end
end

def edit
	@user = current_user
	@cost = @user.cost.find(params[:id])
end

def update
	@user = current_user
	@cost = user.costs.find(params[:id])
		if @cost.update(cost_params)
  			redirect_to user_costs_path
  		else
  			render 'edit'
  		end
end

def destroy
	@user = User.find(params[:user_id])
	@cost = @user.costs.find(params[:id])
	@cost.destroy
	redirect_to user_path(@user)
end

private
	def cost_params
		params.require(:cost).permit(:iteam, :cost)
	end
end