module TasksHelper
  def status_badge(task)
    classes = case task.status
              when "todo"  then "bg-gray-100 text-gray-700"
              when "doing" then "bg-blue-100 text-blue-700"
              when "done"  then "bg-green-100 text-green-700"
              else "bg-gray-100 text-gray-700"
              end
    tag.span task.status_i18n, class: "inline-block text-xs font-semibold rounded-full px-2.5 py-0.5 #{classes}"
  end

  def priority_badge(task)
    classes = case task.priority
              when "low"    then "bg-gray-100 text-gray-700"
              when "medium" then "bg-yellow-100 text-yellow-700"
              when "high"   then "bg-red-100 text-red-700"
              else "bg-gray-100 text-gray-700"
              end
    tag.span task.priority_i18n, class: "inline-block text-xs font-semibold rounded-full px-2.5 py-0.5 #{classes}"
  end
end
