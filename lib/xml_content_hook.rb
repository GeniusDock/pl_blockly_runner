require 'webdrivers'
require 'watir'

module XmlContentHook

    attr_accessor :browser

    def compile_content(content)
      Selenium::WebDriver::Chrome.driver_path='/usr/local/bin/chromedriver'

    if(content.start_with? "<xml")
        if !browser
            browser = Watir::Browser.new :chrome, headless: true
            browser.goto 'http://localhost:4567/prologBlockly'
        end

        code = browser.execute_script("
              var xmlText = '#{content}';
              var xml = Blockly.Xml.textToDom(xmlText);
              var demoWorkspace = new Blockly.Workspace();
              Blockly.Xml.domToWorkspace(xml, demoWorkspace);
              var code = Blockly.PrologLanguage.workspaceToCode(demoWorkspace);
              return code;
        ")
        return code
    end
    return content
  end
end
