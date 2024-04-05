World(Helper)

Before('@skip') do
    pending
end  

After '@user_logout' do

    tasks_page_helper.logout
    # click_button "Logout"
    sleep(2)
end
After do |scenario|
    scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
    scenario_name = scenario.name.delete(',', '')
    scenario_name = scenario.name.delete('(', '')
    scenario_name = scenario.name.delete(')', '')
    scenario_name = scenario.name.delete('#', '')

    if scenario.failed?
        take_screenshot(scenario_name.downcase, 'failed')
    else
        take_screenshot(scenario_name.downcase, 'passed')
    end
end