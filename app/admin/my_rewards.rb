ActiveAdmin.register_page 'My Rewards' do
  content title: 'Rewards' do
    shop.programs.each do |program|
      panel 'To Advocate get' do
        render partial: 'rewards', locals: { section_name: 'advocate' }
      end
      panel 'How much referred get' do
        render partial: 'rewards', locals: { section_name: 'referred' }
      end
      panel 'Advance Settings' do
        render partial: 'reward_eligibilities'
      end
    end
  end

  controller do
    before_action :set_program

    def set_program
      if @shop.programs.blank?
        @shop.programs.create!
      end
    end
  end
end
