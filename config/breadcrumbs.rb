crumb :root do
  link "Home", root_path
end

crumb :about do
  link "BORDER FREEとは", about_path
  parent :root
end

crumb :outline do
  link "団体概要", outline_path
  parent :root
end

crumb :support do
  link "ご寄付・ボランティア", support_path
  parent :root
end

crumb :social do
  link "協賛企業", social_path
  parent :root
end
crumb :classes do
  link "サービス紹介", classes_path
  parent :root
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).