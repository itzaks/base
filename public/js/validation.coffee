VALIDATIONS =
  string: (val) -> val.length isnt 0
  mobile_number: (val) -> val.match /[06]{1}[7]{1}[0-9]{8}/
  zipcode: (val) -> val.match /^(s-|S-){0,1}[0-9]{3}\s?[0-9]{2}$/
  zipcode_uk: (val) -> val.toUpperCase().match /^[A-Z]{1,2}[0-9][0-9A-Z]?\s?[0-9][A-Z]{2}$/g
  email: (val) -> val.match /^\S+@\S+\.\S+$/
  personnummer: (val) ->
    match = val.match /^([1-2][0|9][0-9]{2})([0-1][0-9][0-3][0-9])\-([0-9]){4}/
    match and val.length is 13

valid = (validation, value) ->
  validate = switch typeof(validation).toLowerCase()
    when "string" then VALIDATIONS[validation] or -> true
    else validation
  !!validate(value)

module.exports =
  value: valid
  input: ($input, validation) ->
    $input.removeClass 'is-error'
    is_valid = valid(validation, $input.val())
    $input.addClass 'is-error' unless is_valid
    return is_valid

  form: ($form, validations) ->
    $fields = $form.find("input, textarea, select").removeClass("is-error")
    errorfields = []

    for field, validation of validations
      #which inputs should be validated by valid_check
      $inputs = $fields.filter(field).filter(':visible, :not(.is-disabled)')
      continue unless $inputs.length

      #validate each input with attached validation
      errorfields.push(el) for el in $inputs when not valid(validation, $(el).val())

    $(errorfields).addClass "is-error"
    return errorfields.length is 0
