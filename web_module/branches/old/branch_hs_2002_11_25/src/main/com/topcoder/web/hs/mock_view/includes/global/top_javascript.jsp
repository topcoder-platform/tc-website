<!-- Top JavaScript Begins -->
	<SCRIPT>
	function swapimage (imagename, thenewimage)
	{
		if (document.images) document.images[imagename].src=thenewimage;
	}
	 function openWin(url, name, w, h) 
{
	bio=window.open(url, 'biowin', 	"scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
bio.location.href=url;
bio.focus();
}
	</SCRIPT>
    <SCRIPT TYPE="text/javascript">
  function getGraph(url,wd,ht) {
    var last=0;
    var daHt = parseInt(ht) + parseInt('49');
    var size = "top=2,left=2,width="+wd+",height="+daHt+"status=0";
    var name="graph";
    window.open('graphPopup.jsp?'+url+'&width='+wd+'&height='+ht,name,size);
    return;
  }
</SCRIPT>
<!-- Top JavaScript Ends -->
