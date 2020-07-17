ActiveAdmin.register Group do
  permit_params :start_date, :course_id

  menu priority: 2

  filter :start_date
  filter :course
end
