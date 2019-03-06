class GroupsController < ApplicationController
def index
  @groups = Group.all
end

def home
end

def show
  @group = Group.find_by(id: params[:id])
end

def import
  Group.import(params[:file])
  flash[:notice] = "File Imported"
  redirect_to groups_path
end

def edit
  @group = Group.find_by(id: params[:id])
end

def update
  @group = Group.find_by(id: params[:id])
  if params[:group][:name] != @group.name
  @group.name = params[:group][:name]
end
  if @group.save
    flash[:notice] = "Group successfully Saved"
    redirect_to group_path
  end
end

def destroy

  group = Group.find_by(params[:id])
  if group.delete
    flash[:notice] = "Group successfully deleted"
  redirect_to root_path
  end
end

def new
  @group = Group.new
end

def create

  @group = Group.new(group_params)
  if @group.save
    flash[:notice] = "Group successfully created"
    redirect_to group_path(@group.id)
  end
end


private

def group_params
  params.require(:group).permit(:name)
end


end
