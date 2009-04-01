<?php
// change id elements in following array to relevant page IDs.
$mainPages = array(
	array(
		'class' => 'tournament',
		'id' => 127,
		'rotate' => 1
	),
	array(
		'class' => 'online',
		'id' => 128,
		'rotate' => 17
	),
	array(
		'class' => 'algorithm',
		'id' => 129,
		'rotate' => 3
	),
	array(
		'class' => 'marathon',
		'id' => 144,
		'rotate' => 6
	),
	array(
		'class' => 'moddash',
		'id' => 140,
		'rotate' => 17,
		'liClass' => 'centerBg'
	),
	array(
		'class' => 'studio',
		'id' => 155,
		'rotate' => 14
	),
	array(
		'class' => 'arena',
		'id' => 158,
		'rotate' => 10,
		'liClass' => 'last'
	)
);
?>
<div id="mainNav">
	<ul class="nav">
		<?php
			foreach($mainPages as $page) {
				$link = get_permalink($page['id']);
				if (is_page($page['id'])) {
		?>
				<li <?php echo (isset($page['liClass'])?'class="'.$page['liClass'].'"':''); ?>><a href="<?php echo $link; ?>" class="<?php echo $page['class']; ?>Active"></a></li>
		<?php
				} else {
		?>
				<li <?php echo (isset($page['liClass'])?'class="'.$page['liClass'].'"':''); ?>><a href="<?php echo $link; ?>" class="<?php echo $page['class']; ?>" onmouseover="rotateImage(this,<?php echo $page['rotate']; ?>);" onmouseout="clearRotateImage();"><span class="<?php echo $page['class']; ?>"></span></a></li>
		<?php
				}
			}
		?>

	</ul>
</div><!-- End #mainNav -->
