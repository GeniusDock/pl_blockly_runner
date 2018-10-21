require 'webdrivers'
require 'watir'

module XmlContentHook

    attr_accessor :browser

  def new_browser
        options = Selenium::WebDriver::Chrome::Options.new

	options.add_argument "--no-sandbox"
        options.add_argument "window-size=1200x600"
        options.add_argument "--headless"
        options.add_argument "--disable-gpu"
	options.add_argument "--disable-dev-shm-usage"
        # make the browser
        Watir::Browser.new :chrome, options: options
    end

    def compile_content(content)
	

    if(content.start_with? "<xml")
        if !browser
		
            browser = new_browser;
		
            browser.goto 'http://localhost:3001/prologBlockly'
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
