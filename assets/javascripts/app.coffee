#= require jquery/dist/jquery.min
#= require what-input/what-input.min
#= require foundation-sites/dist/foundation.min
#= require_tree .

'use strict'

$(document).foundation()

# # Always hide the alert box
$('.alert-box').hide()

@Timer = new Timer
