module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (params.dig(:sort, column) == "asc") ? "desc" : "asc"
    link_to title, sort: { column.parameterize.underscore => direction }
  end
end
