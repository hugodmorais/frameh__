class StaticPagesController < ApplicationController

  def index
    @nome = "Hugo"
  end

  def sobre
  end

  def contato  
  end

  def work_groups_static
    @user_groups = UserGroup.all
  end
end
