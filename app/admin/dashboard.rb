ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Students" do
          table_for Student.includes(groups: :course) do
            column(:email)
            column(:groups) do |student|
              ul do
                student.groups.map do |group|
                  li "#{group.start_date} - #{group.course.name}"
                end
              end
            end
          end
        end
      end
    end
  end
end
