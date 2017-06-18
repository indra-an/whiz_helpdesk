class TicketsController < ApplicationController
    load_and_authorize_resource

    before_action :set_conditions, only: [:index]

    def index
      @tickets = @tickets.original.by_keyword(@conditions).order(id: :desc).page(params[:page]).per(PER_PAGE)
    end

    def create
      if @ticket.save
        redirect_to tickets_path, notice: "Ticket has been created!"
      else
        render :new, error: "Failed to create ticket!"
      end
    end

    def update
      respond_to do |format|
        if @ticket.update(ticket_params)
          format.js { flash[:notice] = "Ticket has been updated!" }
        else
          format.js
        end
      end
    end

    def post_reply
      @ticket = Ticket.new(ticket_params)
      if @ticket.save
        redirect_to ticket_path(params[:id]), notice: "Reply ticket successfully!"
      else
        render :new, error: "Failed to reply a ticket!"
      end
    end

    def delete; end

    def destroy
      respond_to do |format|
        if @ticket.destroy
          format.js { flash[:alert] = "Ticket has been deleted!" }
        else
          format.js
        end
      end
    end

    private

    def ticket_params
      params.require(:ticket).permit(:subject, :description, :client_number, :parent_id, :status)
    end
end
