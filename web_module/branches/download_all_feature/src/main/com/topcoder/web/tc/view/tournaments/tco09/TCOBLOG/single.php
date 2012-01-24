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
	<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
<div class="post" id="post-<?php the_ID(); ?>">
			<h2><a href="<?php echo get_permalink() ?>" rel="bookmark" title="Permanent Link: <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>

			<div class="entry">
				<?php the_content('<p class="serif">Read the rest of this entry &raquo;</p>'); ?>

				<?php wp_link_pages(array('before' => '<p><strong>Pages:</strong> ', 'after' => '</p>', 'next_or_number' => 'number')); ?>
				<?php the_tags( '<p>Tags: ', ', ', '</p>'); ?>

				<p class="postmetadata alt">
					<small>
						This entry was posted by
						<?php ?>
						<b><span style="color: #ff9933;"><?php the_author(); ?></span></b> on <?php the_time('l, F jS, Y') ?> at <?php the_time() ?>
						and is filed under <?php the_category(', ') ?>.
						You can follow any responses to this entry through the <?php comments_rss_link('RSS 2.0'); ?> feed.

						<?php if (('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
							?>
							You can <a href="#respond">leave a response</a>, or <a href="<?php trackback_url(); ?>" rel="trackback">trackback</a> from your own site.

						<?php } elseif (!('open' == $post-> comment_status) && ('open' == $post->ping_status)) {
							?>
							Responses are currently closed, but you can <a href="<?php trackback_url(); ?> " rel="trackback">trackback</a> from your own site.

						<?php } elseif (('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
							?>
							You can skip to the end and leave a response. Pinging is currently not allowed.

						<?php } elseif (!('open' == $post-> comment_status) && !('open' == $post->ping_status)) {
							?>
							Both comments and pings are currently closed.

						<?php } edit_post_link('Edit this entry.','',''); ?>

					</small>
				</p>

			</div>
		</div>

	<?php comments_template(); ?>

	<?php endwhile; else: ?>

		<p>Sorry, no posts matched your criteria.</p>

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
