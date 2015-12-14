class RelationshipsController < ApplicationController
  def new
      from = current_user
      to = User.find(params[:user_id])

      r = Relationship.new(from: from, to: to)
      if r.save
        redirect_to users_path
      else
        render 'users#index'
      end
  end
end
