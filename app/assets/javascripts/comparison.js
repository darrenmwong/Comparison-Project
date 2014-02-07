
// // Modal Call ID

// $(document).on("click", "#modal-id", function (m) {
// 	m.preventDefault()
//      var myModalID = $('.modal-title').html;
//      console.log

//      // $(".modal-body").val( myModalID );
// });

// $(gon .btnselector).on('click', function(){
// 	var inner = $("div #modal's id your looking at").html()
// })

//Modal Loader Function //

	// $(function() {
	// 	$('.modal-body').addClass('loader');
	// 	$('.modal-body').load('****SOMETHING*****', function() {
	// 		$('.modal-body').removeClass('loader');
	// 	});
	// })

// Modal Click Method Again With Load

	 // $(document).on('click', '#modal-id', function(ele) {
	 // 	ele.preventDefault();

	 // 	$('.modal-body').html('');
	 // 	$('.modal-body').addClass('loader');
	 // 	$('***SOMETHING***').modal('show');

	 // }





// var $bloomiesURL = 'http://www1.bloomingdales.com/shop/search?keyword='
// var $macysURL = "http://www1.macys.com/shop/search?keyword="
// var $nordURL ="http://shop.nordstrom.com/sr?keyword=#{newsearch}&origin=keywordsearch&contextualcategoryid=0"
// var $barnURL ="http://www.barneys.com/on/demandware.store/Sites-BNY-Site/default/Search-Show?q="


// <script type='text/javascript' charset='utf-8'>
// 	var $dynamicModal = $('#modal-id').click(function(){
// 		var $getTitle = $('modal-title').html;
// 		var $replaceTitle = $getTitle.replace(/' '/g, '+');
// 		var $itemTitle = $replaceTItle.replace(/'-'\','/g, '');
// 		$.ajax({
// 			type:'GET'
// 			url: $bloomiesURL + $itemTitle
// 			data: $('.price').html
// 			success: function(q) {
// 				var bloomPrice = $('.price').html(q);
// 				$('modal-body').load($bloomPrice)
// 			} 
// 		})
// 		console.log
// 	});

// </script>