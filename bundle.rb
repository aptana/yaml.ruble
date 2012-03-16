require 'ruble'

bundle do |bundle|
  bundle.author = 'Benjamin Jackson'
  bundle.contact_email_rot_13 = 'ora@vapbzhzqrfvta.pbz'
  bundle.display_name = t(:bundle_name)
  bundle.description =  <<END
<a href="http://www.yaml.org/">YAML</a> is a straightforward machine parsable data serialization format designed for human readability and interaction with scripting languages such as Perl and Python.
END
  increase_indent = /^\s*.*(:|-) ?(&\w+)?(\{[^}"']*|\([^)"']*)?$/
  decrease_indent = /^\s+\}$/
  bundle.indent['source.yaml'] = increase_indent, decrease_indent

  # Set up folding. Folding is now done in Java code for this language  
  # start_folding = /^[^#]\s*.*:(\s*\[?| &.+)?$/
  # end_folding = /^\s*$|^\s*\}|^\s*\]|^\s*\)/
  # bundle.folding['source.yaml'] = start_folding, end_folding

  bundle.menu t(:bundle_name) do |main_menu|
    main_menu.command t(:key_value)
    main_menu.command t(:add_list_item)
    main_menu.separator
    main_menu.command t(:sort_keys_alphabetically)
    main_menu.command t(:convert_to_ruby)
    main_menu.separator
    main_menu.command t(:cheat_sheet)
  end
end

# Special ENV vars
env "source.yaml" do |e|
  e['TM_COMMENT_START'] = "# "
  e.delete('TM_COMMENT_END')
  e.delete('TM_COMMENT_START_2')
  e.delete('TM_COMMENT_END_2')
  e.delete('TM_COMMENT_DISABLE_INDENT')
end