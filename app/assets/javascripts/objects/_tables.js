// ======================
// Responsive Tables
// ======================

$(document).ready(function(){
  // minor edits made to this plugin in the following places 
  // footable.js lines 20, 21 and 553
  // footable.striping.js lines 12, 13 and 29
  // footable.core.css lines 27 and 39 
  $('th[data-hide]').parent().parent().parent().footable();
  responsive_tables();
});

function responsive_tables(){
	// find each responsive table on the page
	$('table.responsive').each(function(){
		// create an array to store table headings
		var rtArray = [];
		// loop through all table headings
		$(this).find('th').each(function(){
			// store each heading in the array
			rtArray.push($(this).text());
		});
		// loop through all table rows
		$(this).find('tbody tr').each(function(){
			// loop through each cell in the row
			$(this).find('td').each(function(i){
				// prepend each cell with the corresponding heading
				$(this).prepend('<span class="table-responsive-heading">'+rtArray[i] + '</span> ');
			});
		});
	});
}
