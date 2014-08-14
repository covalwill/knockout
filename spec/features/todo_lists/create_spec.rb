require 'spec_helper'

describe "Creating todo lists" do
	it "redirects to the todo lists index page on success" do
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "My todo list"
		fill_in "Description", with: "This is what I'm doing today"
		click_button "Create Todo list"

		expect(page).to have_content("My todo list")
	end

#This test is to display an error when a todo list has no title
	it "displays na error when todo list had no title" do
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: ""
		fill_in "Description", with: "This is what I'm doing today"
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I'm doing today")
	end

#This test will offer a test when a character had less than 3 characters
it "displays an error when todo list has than 3 chracters" do
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New todo_list")

		fill_in "Title", with: "Hi"
		fill_in "Description", with: "This is what I'm doing today"
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to eq(0)

		visit "/todo_lists"
		expect(page).to_not have_content("This is what I'm doing today")
	end

end