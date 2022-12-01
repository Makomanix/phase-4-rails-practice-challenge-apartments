class LeasesController < ApplicationController
before_action :find_lease, only:[:destroy]
    def create
        render json: Lease.create!(lease_params), status: :created
    end

    def destroy
        @lease.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

    def find_lease
        @lease = Lease.find(params[:id])
    end

end
