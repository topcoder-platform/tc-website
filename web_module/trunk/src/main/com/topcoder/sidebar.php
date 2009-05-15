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

<div class="sidebar">



<h2 class="title">Blog Posts</h2>

<!--<?php wp_get_archives('type=daily'); ?>-->
<select name="archive-dropdown" onChange='document.location.href=this.options[this.selectedIndex].value;'>
<option value=""><?php echo attribute_escape(__('Select Day')); ?></option>
<?php wp_get_archives('type=daily&format=option&show_post_count=1'); ?> </select>
<br><br>

<h2 class="title">Blog Categories</h2>
<?php
wp_list_categories('orderby=name&style=none'); ?>
<br>
</div>



<h2 class="title">Event Patron</h2>
	<div class="logo">
	<img src="<?php bloginfo('template_directory'); ?>/style/i/patron-nsa.png" alt="NSA" />
</div>

<h2 class="title">Event Sponsor</h2>
	<div class="logo">
		<img src="<?php bloginfo('template_directory'); ?>/style/i/logo-ieee.png" alt="SNIA" />
	</div>

	<div class="logo">
		<img src="<?php bloginfo('template_directory'); ?>/style/i/logo-snia.png" alt="SNIA" />
	</div>

	<div class="logo">
		<img src="<?php bloginfo('template_directory'); ?>/style/i/logo-facebook.png" alt="SNIA" />
	</div>



</div><!-- End .sponsors -->




