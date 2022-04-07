ActiveAdmin.register RewardEligibility do
  permit_params :id, :minimum_spend, :purchase_review_period, :minimum_successful_conversions,
    :eligible_purchase, :reward_eligiable_id, :reward_eligiable_type, :shop_id

  controller do
    before_action :set_program
    before_action :set_reward_eligibility
    after_action :link_with_program

    def create
      @reward_eligibility = RewardEligibility.new(permitted_params)
      if @reward_eligibility.save
        flash[:notice] = "RewardEligibility is created successfully."
        redirect_to admin_my_rewards_path
      else
      end
    end

    def update
      if @reward_eligibility.update(permitted_params)
        flash[:notice] = "RewardEligibility is updated successfully."
        redirect_to admin_my_rewards_path
      else
      end
    end

    private

    def set_program
      @program = Program.find_by_id(params[:program_id])
    end

    def permitted_params
      params.require(:reward_eligibility).permit(
        :id, :minimum_spend, :purchase_review_period, :minimum_successful_conversions,
        :eligible_purchase, :reward_eligiable_id, :reward_eligiable_type, :shop_id
      )
    end

    def set_reward_eligibility
      @reward_eligibility = RewardEligibility.find_by_id(params[:id])
    end

    def link_with_program
      @program.reward_eligibility = @reward_eligibility
      @program.save
    end
  end
end
