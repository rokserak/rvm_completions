# process rvm_help.txt into rvm.fish

File.foreach('rvm_help.txt') do |i|
  i = i.strip!
  command, description = i.split '#'
  command = command.tr '"', ''
  command = command.strip!
  description = description.tr '"', ''
  description = description.strip!

  File.write('rvm.fish',
             "complete -f -c rvm -n '__fish_use_subcommand' -a #{command} " \
             "-d \"#{description}\"\n",
             mode: 'a')
end
