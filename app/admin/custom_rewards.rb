ActiveAdmin.register CustomReward do
  permit_params :id, :title, :description, :shop_id, :program, :all_products_allowed

  controller do
    before_action :set_program
    before_action :set_custom_reward
    after_action :link_with_program

    def create
      @custom_reward = CustomReward.new(permitted_params)
      if @custom_reward.save
        flash[:notice] = "CustomReward is created successfully."
        redirect_to admin_my_rewards_path
      else
      end
    end

    def update
      if @custom_reward.update(permitted_params)
        flash[:notice] = "CustomReward is updated successfully."
        redirect_to admin_my_rewards_path
      else
      end
    end

    private

    def set_program
      @program = Program.find_by_id(params[:program_id])
    end

    def permitted_params
      params.require(:custom_reward).permit(
        :id, :title, :description, :discount_type, :discount, :program, :shop_id, :all_products_allowed
      )
    end

    def set_custom_reward
      @custom_reward = CustomReward.find_by_id(params[:id])
    end

    def link_with_program
      if params['section_type'] == 'advocate'
        if @program.advocate_programeable != @custom_reward
          @program.advocate_programeable&.destroy
          @program.advocate_programeable = @custom_reward
        end
      else
        if @program.referred_programeable != @custom_reward
          @program.referred_programeable&.destroy
          @program.referred_programeable = @custom_reward
        end
      end

      @program.save
    end
  end
end
