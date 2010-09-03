require 'ruble'

command 'Sort Keys Alphabetically' do |cmd|
  cmd.key_binding = 'F6' # To avoid clash with Eclipse F5 refresh
  cmd.scope = 'source.yaml'
  cmd.output = :replace_selection
  cmd.input = :selection
  cmd.invoke do
    (s = STDIN.read).split(/^#{indent = s.scan(/^(\s*)\b/).flatten.first}(?=\w)/).sort.join(indent)
  end
end
