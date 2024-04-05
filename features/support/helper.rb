require 'fileutils'

# tira screenshot e imbuti no relatorio final
module Helper
    def take_screenshot(file_name, result)

        timer_path = Time.now.strftime('%F').to_s
        file_path = "results/screenshots/test_#{result}/run_#{timer_path}"
        screenshot = "#{file_path}/#{file_name}.png"
        page.save_screenshot(screenshot)
        attach(screenshot, 'image/png', 'Click here')
    end
end
