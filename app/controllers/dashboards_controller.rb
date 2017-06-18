class DashboardsController < ApplicationController
    before_action :check_login

    def check_login
      redirect_to new_user_session_path unless user_signed_in?
    end

    def index
      @count_open_ticket = Ticket.original.open.size
      @count_resolved_ticket = Ticket.original.resolved.size
    end
end
