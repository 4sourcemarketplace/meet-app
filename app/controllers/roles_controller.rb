class RolesController < ApplicationController


def new
end

def edit
end

def destroy
  @role = Role.find_by(id: params[:id])
  @user = User.find_by(id: @role.user_id)
  
  @role.delete
  if @role.delete
  flash[:notice] = "Role Deleted"
  redirect_to group_path(@role.group_id)
  end
end



end
