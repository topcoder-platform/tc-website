<?php get_header(); ?>

	<div class="bottomAreaContent">
		<div class="mainContent">
			<div id="mainContentInner">

				<div class="pageContent">
				<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
						<div class="post" id="post-<?php the_ID(); ?>">
						<h2><?php the_title(); ?></h2>
							<div class="entry">
								<?php the_content('<p class="serif">Read the rest of this page &raquo;</p>'); ?>

								<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>

							</div>
						</div>
						<?php endwhile; endif; ?>
	<?php edit_post_link('Edit this entry.', '<p>', '</p>'); ?>

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

