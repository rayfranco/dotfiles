###
{%= name %}
{%= homepage %}

 Copyright (c) {%= grunt.template.today('yyyy') %} {%= author_name %}
 Licensed under the {%= licenses.join(', ') %} license{%= licenses.length === 1 ? '' : 's' %}.
###

$ = jQuery

defaults =
  someDefault: null

class {%= className %}
  constructor: (@el, settings) ->
    @settings = {}, defaults, settings, @el.data()

(($) ->
  $.fn['{%= name %}'] = (settings) ->
    this.each () ->
        new {%= className %}($(@), settings)
)(jQuery)