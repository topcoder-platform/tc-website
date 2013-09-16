<?php get_header(); ?>
<!--<div class="secNav">
	<div class="secNavLeft">
		<ul id="secNavRight">
		</ul>
	</div>
</div>-->
<div class="bottomAreaContent">
	<div class="mainContent">
		<div id="mainContentInner">
			<div class="pageContent">

		<?php if (have_posts()) : ?>

		<?php $post = $posts[0]; // Hack. Set $post so that the_date() works. ?>
		<?php /* If this is a category archive */ if (is_category()) { ?>
		<h2 class="title">Archive for the &#8216;<?php single_cat_title(); ?>&#8217; Category</h2>
		<?php /* If this is a tag archive */ } elseif( is_tag() ) { ?>
		<h2 class="title">Posts Tagged &#8216;<?php single_tag_title(); ?>&#8217;</h2>
		<?php /* If this is a daily archive */ } elseif (is_day()) { ?>
		<h2 class="title">Archive for <?php the_time('F jS, Y'); ?></h2>
		<?php /* If this is a monthly archive */ } elseif (is_month()) { ?>
		<h2 class="title">Archive for <?php the_time('F, Y'); ?></h2>
		<?php /* If this is a yearly archive */ } elseif (is_year()) { ?>
		<h2 class="title">Archive for <?php the_time('Y'); ?></h2>
		<?php /* If this is an author archive */ } elseif (is_author()) { ?>
		<h2 class="title">Author Archive</h2>
		<?php /* If this is a paged archive */ } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
		<h2 class="title">Blog Archives</h2>
		<?php } ?>

		<?php while (have_posts()) : the_post(); ?>
				<div class="post">
					<h3 id="post-<?php the_ID(); ?>"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h3>
					<p class="postDateArchive"><?php the_time('l, F jS, Y') ?></p>
					<?php the_content() ?>
					<p class="postDateSingle"><?php the_tags('Tags: ', ', ', '<br />'); ?> Posted in <?php the_category(', ') ?> | <?php edit_post_link('Edit', '', ''); ?></p>
				</div>

		<?php endwhile; ?>



	<?php else : ?>

		<h2>Not Found</h2>
		<?php include (TEMPLATEPATH . '/searchform.php'); ?>

	<?php endif; ?>


			</div><!-- End .pageContent -->

					</div><!-- End #mainContentInner -->



				</div><!-- End #mainContent -->
			<?php get_sidebar(); ?>


											</div><!-- End .bottomAreaContent -->

													</div></div>
												</div><!-- End .bottomArea -->

											</div><!-- End #contentInnerInner -->

										</div><!-- End #contentInner -->

										<div class="contentBottomLeft"><div class="contentBottomRight">
											<div class="contentTopInner"></div>
										</div></div>

								</div><!-- End #content -->

							</div><!-- End #wrapperContentInner -->

						</div>
					</div><!-- End #wrapperInner -->
				</div><!-- End #wrapper -->

			<?php get_footer(); ?>
