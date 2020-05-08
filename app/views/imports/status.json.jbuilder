json.html "#{'<i class="fa fa-spinner fa-spin"></i>' if @import.executing?} #{t(@import.status_desc, scope: :imports)}"
json.refreshable @import.running?
