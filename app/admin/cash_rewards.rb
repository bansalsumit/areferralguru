ActiveAdmin.register CashReward do
  permit_params :id, :title, :description, :discount_type, :discount, :program, :shop_id, :all_products_allowed

  controller do
    before_action :set_program
    before_action :set_cash_reward
    after_action :link_with_program

    def create
      @cash_reward = CashReward.new(permitted_params)
      if @cash_reward.save
        flash[:notice] = "CashReward is created successfully."
        redirect_to admin_my_rewards_path
      else
      end
    end

    def update
      if @cash_reward.update(permitted_params)
        flash[:notice] = "CashReward is updated successfully."
        redirect_to admin_my_rewards_path
      else
      end
    end

    private

    def set_program
      @program = Program.find_by_id(params[:program_id])
    end

    def permitted_params
      params.require(:cash_reward).permit(
        :id, :title, :description, :discount_type, :discount, :program, :shop_id, :all_products_allowed
      )
    end

    def set_cash_reward
      @cash_reward = CashReward.find_by_id(params[:id])
    end

    def link_with_program
      if params['section_type'] == 'advocate'
        if @program.advocate_programeable != @cash_reward
          @program.advocate_programeable&.destroy
          @program.advocate_programeable = @cash_reward
        end
      else
        if @program.referred_programeable != @cash_reward
          @program.referred_programeable&.destroy
          @program.referred_programeable = @cash_reward
        end
      end

      @program.save
    end
  end
end
