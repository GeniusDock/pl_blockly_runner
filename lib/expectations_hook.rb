require 'xml_content_hook'

class PrologExpectationsHook < Mumukit::Templates::MulangExpectationsHook
  include_smells true

  include XmlContentHook

  def language
    'Prolog'
  end
end
