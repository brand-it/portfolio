class window.ApplicationDocument
  
  $ = jQuery
  
  #===============================================#
  # Add CaseInsensitive for select                #
  # Usage $(':containsCaseInsensitive("search")') #
  #===============================================#
  $.expr[":"].containsCaseInsensitive= $.expr.createPseudo((arg) ->
    (elem) ->
      $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0
  )
  
  $.fn.extend
    #=========================================================================#
    # Lets set the focus on the first element we can find that is visable.    #
    # ONLY WORKS WITH SIMPLE FORM class .form-control on the input is needed  #
    #=========================================================================#
    set_closest_focus: ->
      @.find('.form-control:visible:first').focus()
      
    #=================================================#
    # Does not figure for scroll location on the page #
    #=================================================#
    is_element_in_viewport: ->
        # window = $(window) Can't make window into a function variable
        return false unless @.length
        @.offset().top >= 0 && @.offset().left >= 0 && @.outerWidth() <= $(window).width() && @.outerHeight() <= $(window).height()

    
  #=====================================================================================#
  # [B-65516](https://www15.v1host.com/RACKSPCE/story.mvc/Summary?oidToken=Story:997306)#
  #=====================================================================================#
  $('#content').set_closest_focus() if $('*[autofocus]').length || $('#content .form-control:visible:first').is_element_in_viewport()
  
  
  #=============================================================================#
  # Hide and show elements on the page                                          #
  # place class .ninja onto any element                                         #
  # In order for a ninja to be hiding you must place him in a foreset           #
  # Forests are ids and they can be what ever you want.                         #
  # To have the ninja to default to hidden add class .hiding                    #
  # In order to revial a ninja you need to have a button                        #
  # with class .reveal_ninjas and data to tell what forest they are in          #
  # Example                                                                     #
  # %a.btn.btn-primary.reveal_ninjas{data: {forests: "#forest-of-trees"}}       #
  #   %span.fa-stack{title: "Toggle Details", data: {placement: :top}}          #
  #     = fa_icon('eye lg')                                                     #
  #     = fa_icon('ban stack-2x toggle-visable', class: 'text-danger hidden')   #
  #                                                                             #
  # #forest-of-trees                                                            #
  #   .ninja.hiding Ninja of the water                                          #
  #=============================================================================#
  $('#content').on 'click', '.reveal_ninjas', ->
    @forests = this.dataset.forests
    @forests ?= 'body .forests'
    @forests = $(@forests)
    
    @ninjas = @forests.find('.ninja')
    
    @ninjas.each ->
      if $(@).hasClass("hiding")
        $(@).removeClass('hiding')
        $(@).set_closest_focus() # Find closest element that has .form-control and setfocus
      else
        $(@).addClass('hiding')
      
    if $(this).find('.fa-toggle-visable').hasClass('hidden')
      $(this).find('.fa-toggle-visable').removeClass("hidden")
    else
      $(this).find('.fa-toggle-visable').addClass('hidden')


  #=========================================================#
  # Group Radio butons by adding class .group_radio_buttons #
  # Only one of the radio buttons can be selected at a time #
  #=========================================================#
  $('#content').on 'change', '.group_radio_buttons', ->
    $('.group_radio_buttons').prop('checked', false)
    $(@).prop('checked', true)


  #=================================================================================================================#
  # In the event you need to update a select-box using a another select-box                                         #
  # use this. See item show page categorizations.                                                                   #
  # Example                                                                                                         #
  # = simple_form_for [@item, @item_categorization], remote: true do |f|                                            #
  #   = f.association :category_set, input_html: {data: {name: "category_sets"}}                                    #
  #   = f.association :category_combination, collection: [], input_html: {data: {name: "category_combinations"}}    #
  #   .panel-footer                                                                                                 #
  #     = f.button :submit, class: "btn-primary"                                                                    #
  #=================================================================================================================#
  update_child_select: (parent, child) ->
    @parent = $(parent)
    @child = $(child)
    $("#{child} option").each ->
      $(@).remove() if $(@).val()
    
    if @parent.val()
      $.ajax
        dataType: 'json'
        url: "/#{@parent.data().name}/#{@parent.val()}/#{@child.data().name}"
        data: 
          all: true
      .done (data) =>
        $(data).each (index, element) =>
          $(new Option(element.name, element.id)).appendTo(child)
        @child.select2("open")
    else
      @child.select2('val', null)
      
      
  #=============================================================
  # Takes a search term and filters (hides) those elements that
  # do not contain the term. The show() call at the beginning is
  # necessary to re-show elements when a user uses the backspace
  # key. Ingenious!!
  #=============================================================    
  filter_view: (elements, term) ->
    elements.show()
    elements.not(":containsCaseInsensitive(" + term + ")").hide()
  