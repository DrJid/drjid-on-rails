require 'spec_helper'


describe "StaticPages" do

	let(:base_title) {"DrJid On Rails"}
	subject { page }

	describe "Home page" do
		before { visit root_path}

		it {should have_selector('h1', text: 'DrJid') }
		it {should have_selector('title', text: full_title('')) }
	end


	describe "Help Page" do 
		before { visit help_path }

		it {should have_selector('h1', text: 'Help') }
		it {should have_selector('title', text: full_title('')) }
	end


	describe "About Page" do
		before { visit about_path }

		it {should have_selector('h1', text: 'About')}
		it {should have_selector('title', text: full_title('')) }
	end

	describe "Contact Page" do
		before { visit contact_path }

		it {should have_selector('h1', text: 'Contact') }
		it {should have_selector('title', text: full_title('')) }
	end


end

