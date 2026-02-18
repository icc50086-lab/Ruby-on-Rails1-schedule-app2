require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "スケジュール一覧"
  end

  test "should create schedule" do
    visit schedules_url
    click_on "新規作成"

    check "All day" if @schedule.all_day
    fill_in "Title", with: "テスト予定"
    fill_in "Start date", with: Date.today
    fill_in "End date", with: Date.today
    fill_in "Memo", with: "メモ"

    # ここのボタン名はあなたのフォームの実際の表示に合わせてください
    # 例: "Create Schedule" / "登録する" / "保存する"
    click_on "Create Schedule"

    # フラッシュ文言が日本語ならここも合わせる
    # 例: "スケジュールを作成しました"
    assert_text "successfully"
  end

  test "should update Schedule" do
    visit schedules_url
    click_on "Edit", match: :first   # ← DestroyじゃなくEdit

    fill_in "Title", with: "更新テスト"
    # ここのボタン名も実際の表示に合わせてください
    click_on "Update Schedule"

    assert_text "successfully"
  end

  test "should destroy Schedule" do
    visit schedules_url

    accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "successfully"
  end
end
