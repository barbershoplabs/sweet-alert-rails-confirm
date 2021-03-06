require 'spec_helper'

describe 'basic confirms', js: true, type: :feature do
  describe 'normal links' do
    before do
      visit confirms_page_path
      find_link("Basic confirm").trigger('click')
    end

    it 'doesnt follow the link when click', :js => true do
      expect(page).to have_content('Are you sure?')
      expect(page).not_to have_content('You got a pretty cow')
    end

    it 'goes to the link after accept confirm' do
      #click_on '.confirm'
      expect(page).to_not have_content('You got a pretty cow')
      sleep 1
      click_button('Ok')
      expect(page).to have_content('You got a pretty cow')
    end
  end

  describe 'methods links' do
    before do
      visit confirms_page_path
      find_link("Delete confirm").trigger('click')
    end

    it 'doesnt follow the link when click', :js => true do
      expect(page).to have_content('Are you sure?')
      expect(page).not_to have_content('You murdered a silly cow')
    end

    it 'goes to the link after accept confirm' do
      #click_on '.confirm'
      expect(page).to_not have_content('You murdered a silly cow')
      sleep 1
      click_button('Ok')
      expect(page).to have_content('You murdered a silly cow')
    end
  end

  describe 'remote links' do
    before do
      visit confirms_page_path
      find_link("Remote confirm").trigger('click')
    end

    it 'doesnt follow the link when click', :js => true do
      expect(page).to have_content('Are you sure?')
      expect(page).not_to have_content('You murdered a silly cow')
    end

    it 'ajax change content in the page after accept confirm' do
      #click_on '.confirm'
      expect(page).to_not have_content('You murdered a silly cow with ajax')
      sleep 1
      click_button('Ok')
      expect(page).to have_content('You murdered a silly cow with ajax')
    end
  end

  describe 'Custom confirm' do
    before do
      visit confirms_page_path
    end
    it 'when click on a link with a confirm and have custom options' do
      find_link("Custom confirm").trigger('click')
      sleep 1
      expect(page).to have_css('.confirm', text: 'Im ready')
      expect(page).to have_css('.cancel', text: 'No way')
      expect(page).to have_css('.icon.info')
      expect(page).to have_css('h2', text: 'Are you ready?')
      expect(page).to have_css('p', text: 'This is a subtitle')

    end
  end

end

