class ReimbursementController < ApplicationController
    def index
        @reimbursement = Reimbursement.empoye_reimbursement(params[:id])
    end
    
end
