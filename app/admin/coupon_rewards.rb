ActiveAdmin.register CouponReward do
  actions only: [:create, :update]

  controller do
    before_action :set_program
    before_action :set_coupon_reward
    after_action :link_with_program

    def create
      @coupon_reward = CouponReward.new(permitted_params)
      if @coupon_reward.save
        flash[:notice] = "CoupanReward is created successfully."
        redirect_to admin_my_rewards_path
      else
      end
    end

    def update
      if @coupon_reward.update(permitted_params)
        flash[:notice] = "CoupanReward is updated successfully."
        redirect_to admin_my_rewards_path
      else
      end
    end

    private

    def set_program
      @program = Program.find_by_id(params[:program_id])
    end

    def permitted_params
      params.require(:coupon_reward).permit(:discount, :title, :coupon_expiry)
    end

    def set_coupon_reward
      @coupon_reward = CouponReward.find_by_id(params[:id])
    end

    def link_with_program
      if params['section_type'] == 'advocate'
        @program.advocate_programeable&.destroy
        @program.advocate_programeable = @coupon_reward
      else
        @program.referred_programeable&.destroy
        @program.referred_programeable = @coupon_reward
      end

      @program.save
    end
  end
end
