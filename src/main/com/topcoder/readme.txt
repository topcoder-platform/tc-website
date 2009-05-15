Steps of add new pages to the navbar:
1. Find the ul tag with id secNavRight
2. Add code to it:
Let's represent the page name by A, and the actual file name is B.

<li<?php
	if (is_page('A'))
	{
		echo " id=\"current\"";
	}?>>
	<a href="<?php bloginfo('url') ?>/B"><span>A</span></a>
</li>
3. Refresh the page then you got it!
