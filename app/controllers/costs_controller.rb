class CostsController < ApplicationController

def create
	@user = User.find(params[:user_id])
	@cost = User.costs.create(cost_params)
	redirect_to user_path(@user)
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