module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    param = column.parameterize.underscore
    direction = (params.dig(:sort, param) == "asc") ? "desc" : "asc"
    link_to title, sort: { param => direction }
  end
end
