<div class="sponsors">
			<!--<?php 	/* Widgetized sidebar, if you have the plugin installed. */
					if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar() ) {
						// change the logo page id here, "include" parameter
						$page = get_posts('include=33&post_type=page');
						if ($page && count($page)>0) {
							setup_postdata($page[0]);
							the_content($page[0]);
						}
					}
			?>-->
<h2 class="title">Event Patron</h2>
	<div class="logo">
	<img src="../style/i/patron-nsa.png" alt="NSA" />
</div>

<h2 class="title">Event Sponsor</h2>
	<div class="logo">
	<img src="../style/i/logo-snia.png" alt="SNIA" />
</div>

<div class="sidebar">



<h2 class="title">Blog Posts</h2>

<?php wp_get_archives('type=weekly'); ?>
<br>

<h2 class="title">Blog Categories</h2>
<?php
wp_list_categories('orderby=name&style=none'); ?>
<br>
</div>

</div><!-- End .sponsors -->




