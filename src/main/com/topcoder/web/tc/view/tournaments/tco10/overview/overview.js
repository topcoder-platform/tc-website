 $(document).ready(function(){
            $.get('http://topcoder.com/home/tco10/feed/', function(data) {
            var iterator = 1;		
	        $("item", data).each(function(){ 				    
				if(iterator<=5){
				   var content = $(this).find('content\\:encoded').text();
                               $('<span>').append(content+"<br>").appendTo("#feeds_element");
				}
				iterator = iterator+1;
                });
            }
            ,'xml'); 

  });


