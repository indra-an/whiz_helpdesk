$(document).on("touchstart.alert click.alert", ".growlyflash", function(e) {
  e.stopPropagation();
  $(this).alert('close');
  return false;
})
