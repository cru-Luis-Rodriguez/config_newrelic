user "jenkins" do
  comment "deployer user"
  home "/home/jenkins"
  shell "/bin/bash"
  password "$1$/.s/cZLJ$1WhWnH9NGgKje8n8e.W8O0"
  action :create
  not_if "grep jenkins /ect/passwd", :environment => { 'HOME' => "/home/jenkins" }
end
