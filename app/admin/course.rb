ActiveAdmin.register Course do
  permit_params :name

  menu priority: 2

  filter :name
end
