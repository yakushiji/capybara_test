require 'spec_helper'

describe "Tasks" do
  describe "GET /tasks" do
    it "display tasks" do
      Task.create!(:name => "paint fence")
      visit tasks_path
      page.should have_content("paint fence")
    end
  end

  describe "POST /tasks" do
    it "creates a task" do
      visit '/tasks/new'
      fill_in "task_name", :with => "mow lawn"
      click_button "Create Task"
      save_and_open_page
        page.should have_content("Task was successfully created.")
      page.should have_content("mow lawn")
    end
  end
end
