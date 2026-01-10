require "application_system_test_case"
require "securerandom"

class TasksTest < ApplicationSystemTestCase
  setup do
    @task = tasks(:one)
  end

  test "visiting the index" do
    visit tasks_url
    assert_selector "h1", text: I18n.t("tasks.index.heading")
  end

  test "should create task" do
    visit tasks_url
    click_on I18n.t("tasks.index.new_task")
    assert_selector "h1", text: I18n.t("tasks.new.title")

    fill_in I18n.t("activerecord.attributes.task.title"), with: unique_title(@task.title)
    fill_in I18n.t("activerecord.attributes.task.description"), with: @task.description
    fill_in I18n.t("activerecord.attributes.task.due_on"), with: @task.due_on

    select I18n.t("activerecord.attributes.task.priorities.#{@task.priority}"),
           from: I18n.t("activerecord.attributes.task.priority")
    select I18n.t("activerecord.attributes.task.statuses.#{@task.status}"),
           from: I18n.t("activerecord.attributes.task.status")

    click_on I18n.t("helpers.submit.task.create")

    assert_text I18n.t("tasks.create.created")
    click_on I18n.t("tasks.show.back_to_tasks")
  end

  test "should update Task" do
    visit task_url(@task)
    click_on I18n.t("tasks.show.edit_task"), match: :first
    assert_text I18n.t("tasks.edit.edit_task")

    fill_in I18n.t("activerecord.attributes.task.title"), with: unique_title(@task.title)
    fill_in I18n.t("activerecord.attributes.task.description"), with: @task.description
    fill_in I18n.t("activerecord.attributes.task.due_on"), with: @task.due_on

    select I18n.t("activerecord.attributes.task.priorities.#{@task.priority}"),
           from: I18n.t("activerecord.attributes.task.priority")
    select I18n.t("activerecord.attributes.task.statuses.#{@task.status}"),
           from: I18n.t("activerecord.attributes.task.status")

    click_on I18n.t("helpers.submit.task.update")

    assert_text I18n.t("tasks.update.updated")
    click_on I18n.t("tasks.show.back_to_tasks")
  end

  test "should destroy Task" do
    visit task_url(@task)
    delete_text = I18n.t("tasks.show.delete_task")

    # Find the actual clickable element first so we can inspect its attributes.
    delete_el = find(:link_or_button, delete_text, match: :first)
    confirm_msg = delete_el["data-turbo-confirm"] || delete_el["data-confirm"]

    if confirm_msg.present?
      accept_confirm do
        delete_el.click
      end
    else
      delete_el.click
    end

    assert_text I18n.t("tasks.destroy.destroyed")
  end

  private

  def unique_title(base)
    "#{base}-#{SecureRandom.hex(4)}"
  end
end
