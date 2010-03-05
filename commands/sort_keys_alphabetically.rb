require 'ruble'

command 'Sort Keys Alphabetically' do |cmd|
  cmd.key_binding = 'F5'
  cmd.scope = 'source.yaml'
  cmd.output = :replace_selection
  cmd.input = :selection
  cmd.invoke do
    (s = STDIN.read).split(/^#{indent = s.scan(/^(\s*)\b/).flatten.first}(?=\w)/).sort.join(indent)
  end
end
