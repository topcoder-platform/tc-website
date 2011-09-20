<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

	<head profile="http://gmpg.org/xfn/11">

		<title>
			<?php echo bloginfo('name'); ?>
		</title>

	    <meta http-equiv="content-type" content="<?php bloginfo('html_type') ?>; charset=<?php bloginfo('charset') ?>" />
		<meta name="description" content="<?php bloginfo('description') ?>" />
		<?php if(is_search()) { ?>
		<meta name="robots" content="noindex, nofollow" />
	    <?php }?>

		<link rel="stylesheet" type="text/css" href="<?php bloginfo('stylesheet_url'); ?>" media="screen" />
		<!--[if IE 6]>
		<link href="<?php echo bloginfo('template_directory'); ?>/ie6.css"> rel="stylesheet" type="text/css" />
       <![endif]-->
		<link rel="alternate" type="application/rss+xml" title="<?php bloginfo('name'); ?> RSS Feed" href="<?php bloginfo('rss2_url'); ?>" />
		<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

		<!-- External JavaScripts -->
		<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/jquery-1.2.6.js"></script>
		<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/jquery.backgroundPosition.js"></script>
		<script type="text/javascript" src="<?php bloginfo('template_directory'); ?>/js/scripts.js"></script>

		<?php wp_head(); ?>

	</head>

	<body>


	<div id="wrapper">
		<div id="wrapperInner">
			<div id="wrapperContent">

				<div id="wrapperContentInner">

					<div id="header">
						<a href="#" class="tco09" title="2009 TopCoder Open"><img src="<?php bloginfo('template_directory'); ?>/style/i/tco09logo.png" alt="TCO 09" /></a>
						<a href="#" class="topCoderLogo"></a>
					</div><!-- End #header -->

					<?php include (TEMPLATEPATH . '/mainNav.php'); ?>

					<div id="content">
							<div class="contentTopLeft"><div class="contentTopRight">
								<div class="contentTopInner"></div>
							</div></div>

							<div id="contentInner" class="contentInner">

								<div id="contentInnerInner">


									<div class="bottomArea">
										<div class="bottomLeft"><div class="bottomRight">

										<div class="secNav">
												<div class="secNavLeft">
													<ul id="secNavRight">

														<li<?php
														       if (is_home())
														         {
														          echo " id=\"currentfirst\"";
														           }?>>
														           <a href="<?php bloginfo('url') ?>/"><span>Blog</span></a>
														        </li>

														<li<?php
														       if (is_page('Photos'))
														        {
														         echo " id=\"current\"";
														          }?>>
														         <a href="<?php bloginfo('url') ?>/photos"><span>Photos</span></a>
														</li>
														<li<?php
														     if (is_page('Movies'))
														        {
														         echo " id=\"current\"";
														          }?>>
														         <a href="<?php bloginfo('url') ?>/movies"><span>Movies</span></a>
														</li>
													</ul>
												</div>
											</div><!-- End .secNav -->



									        <div class="tertiaryBlogNav">
            									<ul id="tertNav">
														<!--<li<?php
														       if (is_page('member-intros'))
														        {
														         echo " id=\"currenttert\"";
														          }?>>
														         <a href="<?php bloginfo('url') ?>/movies/member-intros"><span>Member Intros</span></a>
														</li>-->
												</ul>
											</div>
									</div><!-- End tertiaryNav-->
