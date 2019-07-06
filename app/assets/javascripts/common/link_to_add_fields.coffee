class window.LinkAddFields
  @associate: (link_id, target_id) ->
    link_add_obj = $('#' + link_id)
    target = $('#' + target_id)
    class_this = @

    # New compete
    link_add_obj.on 'click', (event) ->
      event.preventDefault()
      obj = $($(@).data('form-prepend'))
      child_index = (new Date).getTime()
      obj.find('input, select, textarea').each ->
        $(@).attr 'name', @name.replace '[new_record]', "[#{child_index}]"
        $(@).attr 'id', @id.replace '_new_record_', "_#{child_index}_"
      obj.appendTo target
      AppForm.init()

    # Delete compete with rails confirmation dialog
    target.on 'confirm:complete', '.delete_compete[data-confirm]', (event) ->
      event.preventDefault()
      confirmed = event.originalEvent.detail[0]
      class_this.delete_compete @ if confirmed

    # Delete compete without rails confirmation dialog
    target.on 'click', '.delete_compete:not([data-confirm])', (event) ->
      event.preventDefault()
      class_this.delete_compete @

  @delete_compete: (delete_link) ->
    $(delete_link).find('input').val(true)
    $(delete_link).closest('.compete_fields').addClass('hidden')
