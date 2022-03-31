ActiveAdmin.register_page 'Rewards' do
  content title: 'Rewards' do
    panel 'To Advocate get' do
      render partial: 'coupan_rewards'
      # render partial: 'cash_rewards'
      # render partial: 'custom_rewards'
    end
    panel 'How much advocate get' do
      # render partial: 'coupan_rewards'
      # render partial: 'cash_rewards'
      # render partial: 'custom_rewards'
    end
    panel 'Advance Settings' do
      # render partial: 'reward_eligibilities'
    end
  end
end
