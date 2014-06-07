desc "Run server"
task :default do
  sh "rvmsudo ruby main.rb"
end

desc "Commit changes"
task :ci, [ :message ] => :keep_secrets do |t, args|
  message = args[:message] || ''
  sh "git ci -am '#{message}'"
end

desc "Open browser in GitHub repo"
task :github do
  sh "https://github.com/alu0100702149/luces"
end

