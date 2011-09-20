<?php
	$latest = get_posts("orderby=date&numberposts=1");
	setup_postdata($latest[0]);
?>
<!-- change page id here -->
<a href="<?php echo get_permalink(46); ?>" class="more"></a>
<div class="spotlightBlogHead"><span class="spotlightBlogAuthor"><?php the_author(); ?></span> Wrote:</div>
<div class="spotlightBlogContent"> <?php the_content_rss('', False,'', 20); ?></div>
