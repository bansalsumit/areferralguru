ActiveAdmin.register_page 'My Rewards' do
  content title: 'Rewards' do
    panel 'To Advocate get' do
      render partial: 'rewards', locals: { section_name: 'advocate' }
    end
    panel 'How much referred get' do
      render partial: 'rewards', locals: { section_name: 'referred' }
    end
    # panel 'Advance Settings' do
    #   render partial: 'reward_eligibilities'
    # end
  end
end
