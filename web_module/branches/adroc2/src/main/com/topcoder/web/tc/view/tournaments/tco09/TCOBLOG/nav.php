<div class="secNav">
	<div class="secNavLeft">
		<ul id="secNavRight">
			<?php
				$args = array(
					'post_type' => 'page',
					'numberposts' => -1,
					'post_parent' => $post->ID,
					'orderby' => 'menu_order'
				); 
				$secondary_pages = get_posts($args);
				for($i=0;$i<count($secondary_pages);$i++) {
			?>
				<li <?php echo ($i==0?'class="first"':''); ?> <?php echo ($i==count($seconday_pages)-1?'class="last"':''); ?>>
					<a href="javascript:;" <?php echo ($i==0?'class="on"':''); ?> onclick="showSecTab(this,<?php echo $i; ?>); showTabContent(<?php echo $i; ?>); setCurrentPage('<?php echo the_title(); ?> > '+$(this).text())">
						<span><?php echo $secondary_pages[$i]->post_title; ?></span>
					</a>
				</li>
			<?php
				}
				$tabID = $i;
			?>
		</ul>
	</div>
</div><!-- End .secNav -->

<div id="tertiaryNav">
	<?php
		foreach($secondary_pages as $id => $page) {
	?>
	<div>
		<ul class="tertNav">
	<?php
			$args = array(
				'post_type' => 'page',
				'numberposts' => -1,
				'post_parent' => $page->ID,
				'orderby' => 'menu_order'
			); 
			$tertiary_pages = get_posts($args);
			for($i=0;$i<count($tertiary_pages);$i++) {
	?>
				<li>
					<a href="javascript:;" onclick="showTabContent(<?php echo $tabID++; ?>); setCurrentPage('<?php echo the_title(); ?> > '+$($('#secNavRight > LI')[<?php echo $id; ?>]).text()+' > '+$(this).text())">
						<?php echo $tertiary_pages[$i]->post_title; ?>
					</a>
				</li>
	<?php
			}
	?>
		</ul>
	</div>
	<?php
		}
	?></div><!-- End #tertiaryNav -->
