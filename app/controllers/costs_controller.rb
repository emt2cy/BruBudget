class CostsController < ApplicationController

def index
	@costs = Cost.all
end

def show
	@cost = Cost.find(params[:id])
end

def new
	@cost = Cost.new
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
	@cost = Cost.find(params[:id])
end

def update
	@user = current_user
	@cost = user.costs.update(user_params)

	if @cost.update(user_params)
		redirect_to @cost
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