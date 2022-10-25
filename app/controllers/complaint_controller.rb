class ComplaintController < ApplicationController
  def index
    @complaint = Complaint.findComplaints(params[:id])
  end
end
