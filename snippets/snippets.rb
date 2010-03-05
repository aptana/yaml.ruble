snippet 'key: value' do |s|
  # FIXME No tab trigger, probably needs to become command
  s.key_binding = 'CONTROL+M2+;'
  s.scope = 'source.yaml - string'
  s.expansion = '${1:key}: ${2:value}$0'
end

