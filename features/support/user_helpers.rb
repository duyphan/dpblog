module UserHelpers
	def automatic_login
    @me ||= FactoryGirl.create(:user, :email => "pduy1206@gmail.com")
    visit new_session_path

  	fill_in 'email', :with => @me.email
  	fill_in 'password', :with => @me.password
 
    click_link "Log In"
  end

  def confirm_login
    page.has_content?("Logged In!")
  end

  def confirm_article_page
    page.has_content?("Logged In!")
    page.has_content?("Listing articles")
  end

end

World(UserHelpers)