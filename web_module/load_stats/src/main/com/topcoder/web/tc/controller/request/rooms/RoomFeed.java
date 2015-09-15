package com.topcoder.web.tc.controller.request.rooms;

import com.topcoder.web.tc.controller.request.Base;

import java.net.URL;
import java.util.List;

import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;
import com.sun.syndication.io.impl.XmlFixerReader;

/**
 * Servlet implementation class RoomFeed
 */
public class RoomFeed extends Base {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RoomFeed() {
    }

    @Override
    protected void businessProcessing() throws Exception {
        try {
            System.out.println("------here------");
            String feedUrlStr = "http://community.topcoder.com/roomscontent/";
            String token = getRequest().getParameter("token");
            System.out.println("------1111111111111111------");
            if(token != null && token.length() > 0) {
                URL feedUrl = new URL(feedUrlStr+ "api/" + token + "/feed/?withoutcomments=1");

                SyndFeedInput input = new SyndFeedInput();
                SyndFeed feed = input.build(new XmlReader(feedUrl));

                List<SyndEntry> syndEntries = feed.getEntries();
                System.out.println("------222222222222222222222------");
                getRequest().setAttribute("articles", syndEntries);

            } else{
                URL feedUrl = new URL(feedUrlStr + "feed/?post_type=api");
                SyndFeedInput input = new SyndFeedInput();
                System.out.println("------333333333333333333------");
                SyndFeed feed = input.build(new XmlReader(feedUrl));
                List<SyndEntry> syndEntries = feed.getEntries();
                System.out.println("------444444444444444------");
                getRequest().setAttribute("articles", syndEntries);

            }
            setNextPage("/rooms/wordpress_feed.jsp");
            setIsNextPageInContext(true);
        } catch(Exception ex) {
            System.out.println("------------"+ex);
            throw new RuntimeException(ex);
        }
    }
}
