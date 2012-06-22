require 'spec_helper'


describe "StaticPages" do

	let(:base_title) {"DrJid On Rails"}


	describe "Home page" do

		it "should have the h1 'DrJid'" do
			visit root_path
			page.should have_selector('h1', :text => "DrJid")
		end

		it "should have the base title" do
			visit root_path
			page.should have_selector('title', :text => "#{base_title}")
		end

		it "should not have a custom page title" do
			visit root_path
			page.should_not have_selector('title', :text => '| Home')
		end
	end


	describe "Help Page" do 

		it "should have the h1 'Help'" do
			visit help_path
			page.should have_selector('h1', :text => 'Help')
		end

		it "should have the title 'Help'" do
			visit help_path
			page.should have_selector('title', :text => "#{base_title} | Help")
		end
	end


	describe "About Page" do

		it "should have the h1 'About'" do
			visit about_path
			page.should have_selector('h1', :text => 'About')
		end

		it "should have the title 'About Us'" do
			visit about_path
			page.should have_selector('title', :text => "#{base_title} | About")
		end
	end

	describe "Contact Page" do
		it "should have the h1 'Contact'" do
			visit contact_path
			page.should have_selector('h1', :text => 'Contact')
		end

		it "should have the title 'Contact'" do
			visit contact_path
			page.should have_selector('title', :text => "#{base_title} | Contact")
		end
	end


end

