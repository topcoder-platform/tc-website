package com.topcoder.web.winformula.controller.request;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.tc.Constants;

/**
 */
public class RSSFeed extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        //stream it out via the response
//        getResponse().addHeader("content-disposition", "inline; filename=\"" + d.getOriginalFileName() + "\"");
//        getResponse().setContentType(d.getMimeType().getDescription());

        String feed = null;
        if (hasParameter("feed")) {
            feed = getRequest().getParameter("feed");
        }

        ServletOutputStream sos = getResponse().getOutputStream();

        String url = "";
        if (feed.equals("blog")) {
            url =  "http://topcoderblogs.com/winningformula/?feed=rss"; 
        } else if (feed.equals("forum")) {
            url =  "http://forums.topcoder.com/?module=RSS&categoryID=13"; 
        } else if (feed.equals("espn")) {
            url =  "http://sports.espn.go.com/espn/news/story?page=rssinfo"; 
        } 
        
        URL p = new URL(url);
        HttpURLConnection con = null;
        try { 
            con = (HttpURLConnection) p.openConnection();
            con.setRequestMethod("GET");
            con.connect();
            InputStream in = null;
            try {
                in = con.getInputStream();
                int size = 0;
                int c;
                byte[] buf = new byte[4096];
                while ((c = in.read(buf)) != -1) {
                    sos.write(buf, 0, c);
                    size+=buf.length;
                }
                getResponse().setContentType("text/xml");
                getResponse().addHeader("Content-Length", String.valueOf(size));
                getResponse().setStatus(HttpServletResponse.SC_OK);
                getResponse().flushBuffer();
            } finally {
                if (in != null) in.close();
            }
        } finally {
            if (con != null) con.disconnect();
        }
    }
}