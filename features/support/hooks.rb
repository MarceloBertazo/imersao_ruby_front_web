Before do
  @app = App.new
end

After do |scenario|
  @t = Time.now
  if scenario.failed?
    page.save_screenshot("screenshots/#{@t.to_i}-#{scenario.name}_Failed.png")
  end
  if scenario.passed?
    page.save_screenshot("screenshots/#{@t.to_i}-#{scenario.name}_Passed.png")
  end  
end
