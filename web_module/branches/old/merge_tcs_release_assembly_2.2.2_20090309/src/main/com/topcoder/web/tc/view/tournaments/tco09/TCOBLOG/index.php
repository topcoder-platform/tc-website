<?php get_header(); ?>

<div class="bottomAreaContent">

	<div class="mainContent">

		<div id="mainContentInner">
			<div class="pageContent">
				<?php if (have_posts()) : ?>

					<?php while (have_posts()) : the_post(); ?>

						<div class="post" id="post-<?php the_ID(); ?>">
							<h2 class="title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
							<p class="postDate"><?php the_time('F jS, Y') ?>  by <?php the_author() ?></p>

							<?php the_content('Read the rest of this entry &raquo;'); ?>

							<p><?php the_tags('Tags: ', ', ', '<br />'); ?> Posted in <?php the_category(', ') ?> | <?php edit_post_link('Edit', '', ''); ?> </p>
						</div>

					<?php endwhile; ?>



				<?php else : ?>

					<h2>Not Found</h2>
					<p>Sorry, but you are looking for something that isn't here.</p>
					<?php include (TEMPLATEPATH . "/searchform.php"); ?>

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
