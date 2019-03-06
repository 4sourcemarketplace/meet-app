class Group < ApplicationRecord
  require 'csv'
  require 'pry'
  has_many :roles

  def self.import(file)
    all = []
    CSV.foreach(file.path, headers:false) do |row|
      # Interpreting the values based on row sequence
      @first_name = row[0]
      @last_name = row[1].gsub(/\s+/, "")
      @identifier = @first_name + @last_name
      @group_name = row[2].gsub(/\s+/, "")
      @role = row[3].downcase.gsub(/\s+/, "")


      #estabslishing instance variables of model of each with logic
      @group = Group.find_by(name: @group_name) || Group.new(name: @group_name)
      @group.save
      puts @group

      # At scale, names will get tricky. My identifier is basic, but I project to updgrade it with some sort of their personal data
      @user = User.find_by(identifier: @identifier) || User.new(first_name: @first_name, last_name: @last_name, identifier: @identifier)
      @user.save
      puts @user

      # Join
      @new_role = Role.find_by(user_id: @user.id, group_id: @group.id) || Role.new(user_id: @user.id, group_id: @group.id)
  
      # Boolean value for their role
      if @role == "organizer"
        @new_role[:organizer] = true
        @new_role.save
      end

      if @role == "participant"
        @new_role[:participant] = true
      end

      if @role == "presenter"
        @new_role[:presenter] = true
      end

      @new_role.save
      puts @new_role
      end
    end


end
