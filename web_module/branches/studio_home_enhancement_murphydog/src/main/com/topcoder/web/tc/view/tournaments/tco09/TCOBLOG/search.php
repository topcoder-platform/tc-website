<?php get_header(); ?>
<div class="secNav">
	<div class="secNavLeft">
		<ul id="secNavRight">
		</ul>
	</div>
</div>
<div class="bottomAreaContent">	
	<div class="mainContent">
		<div id="mainContentInner">
			<div class="pageContent">
	<?php if (have_posts()) : ?>

		<h2 class="title">Search Results</h2>

		<?php while (have_posts()) : the_post(); ?>

			<div class="post">
				<h3 id="post-<?php the_ID(); ?>"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h3>
				<p><?php the_time('l, F jS, Y') ?></p>
				<p><?php the_tags('Tags: ', ', ', '<br />'); ?> Posted in <?php the_category(', ') ?> | <?php edit_post_link('Edit', '', ''); ?></p>
			</div>

		<?php endwhile; ?>

		<ul class="blogNav">
			<li><?php next_post_link('&laquo; Older Entries') ?></li>
			<li><?php previous_post_link('Newer Entries &raquo;') ?></li>
		</ul>

	<?php else : ?>

		<h2>No posts found. Try a different search?</h2>
		<?php include (TEMPLATEPATH . '/searchform.php'); ?>

	<?php endif; ?>

			</div><!-- End .pageContent -->

		</div><!-- End #mainContentInner -->

	</div><!-- End #mainContent -->

	<?php get_sidebar(); ?>
		
</div><!-- End .bottomAreaContent -->

<?php get_footer(); ?>
