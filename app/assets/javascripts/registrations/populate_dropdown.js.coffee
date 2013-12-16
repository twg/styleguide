# ---------------------------------------------------------
# Populates a destination dropdown from an array
# src: a jQuery select field
# dst: a jQuery select field
# array: {A: [name, id], B: [name, id], ...} where A and B are values in the src select
# ---------------------------------------------------------
window.populate_dropdown = (src, dst, hash, blank_string) ->
  dst = dst.get(0)
  array = hash[src.val()]

  # Empty options
  for option in dst.options
    dst.options[option] = null

  # Put in the blank one.
  dst.options.length = 0
  index_offset = 0
  if blank_string
    dst.options[0] = new Option(blank_string, '')
    dst.options.length = 1
    index_offset = 1

  dst.selectedIndex = 0
  
  # Populate the dst with items from the array
  unless array == undefined
    for item, i in array
      dst.options[i + index_offset] = new Option(item[0], item[1])
