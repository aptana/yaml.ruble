require 'ruble'

bundle 'YAML' do |bundle|
  bundle.author = 'Benjamin Jackson'
  bundle.contact_email_rot_13 = 'ora@vapbzhzqrfvta.pbz'
  bundle.description =  <<END
<a href="http://www.yaml.org/">YAML</a> is a straightforward machine parsable data serialization format designed for human readability and interaction with scripting languages such as Perl and Python.
END
  increase_indent = /^\s*.*(:|-) ?(&\w+)?(\{[^}"']*|\([^)"']*)?$/
  decrease_indent = /^\s+\}$/
  bundle.indent['source.yaml'] = increase_indent, decrease_indent
  start_folding = /^[^#]\s*.*:(\s*\[?| &.+)?$/
  end_folding = /^\s*$|^\s*\}|^\s*\]|^\s*\)/
  bundle.folding['source.yaml'] = start_folding, end_folding
  bundle.file_types['source.yaml'] = '*.yaml', '*.yml'

  bundle.menu 'YAML' do |main_menu|
    main_menu.command 'key: value'
    main_menu.command 'Add list item'
    main_menu.separator
    main_menu.command 'Sort Keys Alphabetically'
    main_menu.command 'Convert Document / Selection to Ruby'
    main_menu.separator
    main_menu.command 'Syntax Cheat Sheet'
  end
end

# Extend Ruble::Editor to add special ENV vars
module Ruble
  class Editor
    unless method_defined?(:to_env_pre_yaml_bundle)
      alias :to_env_pre_yaml_bundle :to_env
      def to_env
        env_hash = to_env_pre_yaml_bundle
        scopes = current_scope.split(' ')
        if !scopes.select {|scope| scope.start_with? "source.yaml" }.empty?
          env_hash['TM_COMMENT_START'] = "# "
          env_hash.delete('TM_COMMENT_END')
          env_hash.delete('TM_COMMENT_START_2')
          env_hash.delete('TM_COMMENT_END_2')
          env_hash.delete('TM_COMMENT_DISABLE_INDENT')
        end
        env_hash
      end
    end
  end
end