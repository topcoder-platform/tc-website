package com.topcoder.web.winformula.controller.request;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.winformula.Constants;

/**
 * 
 */
public class RSSFeeder extends BaseProcessor {
  
// dev    
//    private static String[] urls = {"http://topcoderblogs.com/winningformula/?feed=rss", 
//        "http://www.dev.topcoder.com/winformula/forums?module=RSS&categoryID=1", 
//        "http://sports.espn.go.com/espn/rss/ncf/news"};

    private static String[] urls = {Constants.BLOG_RSS_URL, 
        Constants.FORUM_RSS_URL, 
        Constants.ESPN_RSS_URL};

// dev
//    private static String forumPass = new BASE64Encoder().encode("alexdelarge:cl0ckw0rk".getBytes());
//    private static String[] passws = new String[] {null, forumPass, null};
   
    private static String[] passws = new String[] {null, null, null};

    private static String[] xsls = new String[] {"blog.xsl", "forum.xsl", "espn.xsl"};

    protected void businessProcessing() throws Exception {
        String feed = null;
        if (!hasParameter("feed")) {
            throw new NavigationException("Invalid request");
        }
        feed = getRequest().getParameter("feed")+".";

        log.debug("Feed " + feed + " requested");
        
        int index = -1;
        for (int i = 0; i < xsls.length; i++) {
            if (xsls[i].indexOf(feed) == 0) {
                index = i;
                break;
            }
        }
        if (index == -1) {
            throw new NavigationException("Invalid request.");
        }
        getResponse().setContentType("text/html");
        getResponse().setStatus(HttpServletResponse.SC_OK);
         
        feedURLS(urls[index], passws[index], xsls[index]);
    }

    private void feedURLS(String url, String pass, String xsl) throws IOException, TransformerException {
        log.debug("Feed's URL: " + url);

        PrintWriter out = getResponse().getWriter();
        TransformerFactory tFactory =  TransformerFactory.newInstance();

        Source xslSource = new StreamSource(getClass().getResourceAsStream("/winformula/"+xsl));

        Transformer transformer = tFactory.newTransformer(xslSource);
        URL p = new URL(url);
        HttpURLConnection con = null;
        con = (HttpURLConnection) p.openConnection();
        try {
            con.setReadTimeout(Constants.TIMEOUT_MILLISECS);
            con.setConnectTimeout(Constants.TIMEOUT_MILLISECS);
            if (pass != null) {
                con.setRequestProperty("Authorization", "Basic " + pass);
            }
            InputStream is = con.getInputStream();
            try {
                Source xmlSource = new StreamSource(is);
                transformer.transform(xmlSource, new StreamResult(out));
                out.flush();
            } finally {
                try { is.close(); } catch (Exception e) { }
            }
        } finally {
            try { con.disconnect(); }  catch (Exception e) { }
        }
    }
}