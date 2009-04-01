<?php
/*
Template Name: Archives
*/
?>

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
<?php include (TEMPLATEPATH . '/searchform.php'); ?>

	<h2 class="title">Archives by Month:</h2>
	<ul>
		<?php wp_get_archives('type=monthly'); ?>
	</ul>

	<h2 class="title">Archives by Subject:</h2>
	<ul>
		 <?php wp_list_categories(); ?>
	</ul>

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

