class TaskMailer < ActionMailer::Base
  default from: "redmine.logicmatter@gmail.com"
def task_creation(usermail)
@task_acceptor = usermail
    mail(:to =>@task_acceptor, :subject => "Task", :from => "redmine.logicmatter@gmail.com")
  end
end
