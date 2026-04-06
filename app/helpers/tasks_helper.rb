module TasksHelper
  def status_badge(task)
    config = case task.status
             when "todo"  then { bg: "bg-slate-100", text: "text-slate-600", dot: "bg-slate-400" }
             when "doing" then { bg: "bg-indigo-50", text: "text-indigo-700", dot: "bg-indigo-500" }
             when "done"  then { bg: "bg-emerald-50", text: "text-emerald-700", dot: "bg-emerald-500" }
             else { bg: "bg-slate-100", text: "text-slate-600", dot: "bg-slate-400" }
             end
    tag.span class: "inline-flex items-center gap-1.5 text-xs font-medium rounded-full px-2.5 py-1 #{config[:bg]} #{config[:text]}" do
      tag.span("", class: "w-1.5 h-1.5 rounded-full #{config[:dot]}") + task.status_i18n
    end
  end

  def priority_badge(task)
    config = case task.priority
             when "low"    then { bg: "bg-slate-100", text: "text-slate-600" }
             when "medium" then { bg: "bg-amber-50", text: "text-amber-700" }
             when "high"   then { bg: "bg-rose-50", text: "text-rose-700" }
             else { bg: "bg-slate-100", text: "text-slate-600" }
             end
    tag.span task.priority_i18n, class: "inline-block text-xs font-medium rounded-full px-2.5 py-1 #{config[:bg]} #{config[:text]}"
  end

  def due_on_display(task)
    return nil unless task.due_on.present?

    today = Date.current
    diff = (task.due_on - today).to_i

    color = if diff < 0
              "text-rose-600"
            elsif diff <= 3
              "text-amber-600"
            else
              "text-slate-500"
            end

    label = if diff < 0
              t("tasks.due.overdue")
            elsif diff == 0
              t("tasks.due.today")
            elsif diff == 1
              t("tasks.due.tomorrow")
            else
              l(task.due_on, format: :short)
            end

    tag.span class: "inline-flex items-center gap-1 text-xs #{color}" do
      tag.svg(
        tag.path("", d: "M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z",
                 "stroke-linecap": "round", "stroke-linejoin": "round", "stroke-width": "2"),
        class: "w-3.5 h-3.5", fill: "none", stroke: "currentColor", viewBox: "0 0 24 24"
      ) + label
    end
  end
end
