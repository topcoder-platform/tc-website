/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 *
 * <p>This is a helper javascript for the home page in order to retrieve RSS feeds.</p>
 * 
 * @author pulky
 * @version 1.0
 *
 */

/**
 * <p>This method loads a particular feed, transform it and add the result as the inner HTML of the specified element.
 * If an error occurs, it adds errorMessage content.</p>
 *
 * @param rss the rss source
 * @param template the transformation template
 * @param element the target element for the transformed text
 * @param errorMessage the error message to be shown if any error occurs
 *
 * @throws Exception if any error occurs
 */
function loadFeed(rss, template, element, errorMessage) {
    try {
        var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
        document.getElementById(element).innerHTML = (processor.transformRSSFeed(rss));
    } catch (e) {
        document.getElementById(element).innerHTML = errorMessage;
        throw e;
    }
}

/**
 * <p>This method loads the three RSS feeds in the studio home page.</p>
 *
 * @throws Exception if any error occurs
 */
function loadHomePageFeeds() {
    loadFeed("http://topcoder.com/home/studio/?cat=11&feed=rss2", "js/DesignShowcaseTemplate.txt", "showcase_content",
        "Error reading Design Showcase feed.");
 
    loadFeed("http://topcoder.com/home/studio/feed", "js/ThoughtsFromTheBlogTemplate.txt", "post_content", 
        "Error reading Thoughts From The Blog feed.");
 
    loadFeed("js/mockContestChatterFeed.xml", "js/ContestChatterTemplate.txt", "bottom_part_r", 
         "Error reading Contest Chatter feed.");
}
