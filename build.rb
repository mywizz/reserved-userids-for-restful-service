#!/usr/bin/env ruby
targets = {
  'comma' => lambda {|words| words.join(',')},
  'newline' => lambda {|words| words.join("\n")},
  'comma_and_single_quotation' => lambda {|words| words.collect {|word| "'" + word + "'"}.join(',')},
  'comma_and_double_quotation' => lambda {|words| words.collect {|word| '"' + word + '"'}.join(',')}
}

f = File.new("readme.md", "r")
    keywords = f.readlines.select{|k|k.chomp.length > 0}.each{|k|
      k.downcase!
      k.chomp!
    }.sort.uniq
f.close

targets.each do |target, func|
  File.open(target + ".txt", 'w') {|f| f.write(func.call keywords) }
end