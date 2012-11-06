
package com.topcoder.web.tc.controller.rooms;

import java.io.IOException;
import java.net.URL;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.HttpObjectFactory;

import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;
import com.sun.syndication.io.impl.XmlFixerReader;

/**
 * Servlet implementation class WordpressFeedServlet
 */
public class WordpressFeedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    /**
     * Default constructor. 
     */
    public WordpressFeedServlet() {
       
    }
	
	 


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)  {
	try {
	
		System.out.println("------here------");
		String feedUrlStr = "http://community.topcoder.com/roomscontent/";
		String token = request.getParameter("token");System.out.println("------1111111111111111------");
		if(token != null && token.length() > 0) {
			URL feedUrl = new URL(feedUrlStr+ "api/" + token + "/feed/?withoutcomments=1");
			
			SyndFeedInput input = new SyndFeedInput();
			SyndFeed feed = input.build(new XmlReader(feedUrl));
			
			List<SyndEntry> syndEntries = feed.getEntries();System.out.println("------222222222222222222222------");
			request.setAttribute("articles", syndEntries);
			request.getRequestDispatcher("/rooms/wordpress_feed.jsp").forward(request, response);
			
		} else{
			URL feedUrl = new URL(feedUrlStr + "feed/?post_type=api");
			SyndFeedInput input = new SyndFeedInput();
			System.out.println("------333333333333333333------");
			SyndFeed feed = input.build(new XmlReader(feedUrl));
			List<SyndEntry> syndEntries = feed.getEntries();
			System.out.println("------444444444444444------");
			request.setAttribute("articles", syndEntries);
			request.getRequestDispatcher("/rooms/wordpress_feed.jsp").forward(request, response);
			
		}
	} catch(Exception ex) {
		System.out.println("------------"+ex);
		throw new RuntimeException(ex);
	}
		
	}
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        doPost(request, response);
    }

}
