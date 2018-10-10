class PrologMetadataHook < Mumukit::Hook
  def metadata
    {language: {
        name: 'prolog-blockly',
        icon: {type: 'devicon', name: 'prolog'},
        version: 'swi-prolog 6.6.4',
        extension: 'pl',
        ace_mode: 'prolog',
        prompt: '?'
    },
    layout_assets_urls: {
        html: [
          'assets/polymer.html'
        ]
      },
      editor_assets_urls: {
        js: [
          'assets/editor/editor.js'
        ],
        html: [
          'assets/editor/editor.html',
        ],
        css: [
          'assets/editor/editor.css'
        ]
      },
     test_framework: {
         name: 'plunit',
         test_extension: 'pl',
         template: <<prolog
test(test_description_example):-
	aPredicate(anIndividual).
prolog
     }}
  end
end
