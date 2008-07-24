package com.topcoder.web.winformula.controller.request;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Encoder;

import com.topcoder.web.common.BaseProcessor;

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

        String pass = new BASE64Encoder().encode("alexdelarge:cl0ckw0rk".getBytes());

        String url = "";
        if (feed.equals("blog")) {
            url =  "http://topcoderblogs.com/winningformula/?feed=rss"; 
        } else if (feed.equals("forum")) {
            url =  "http://www.dev.topcoder.com/winformula/forums?module=RSS&categoryID=1"; 
        } else if (feed.equals("espn")) {
            url =  "http://sports.espn.go.com/espn/rss/ncf/news"; 
        } 
        
        

        log.debug("RSS url: " + url);
        
        URL p = new URL(url);
        HttpURLConnection con = null;
        try { 
            con = (HttpURLConnection) p.openConnection();
            if (feed.equals("forum")) {
                con.setRequestProperty("Authorization", "Basic " + pass);
            }
            con.setRequestMethod("GET");
            log.debug("before con.connect()...");
            con.connect();
            log.debug("after con.connect()...");
           InputStream in = null;
            try {
                log.debug("before con.getInputStream()...");
                in = con.getInputStream();
                log.debug("after con.getInputStream()...");
                int size = 0;
                int c;
                byte[] buf = new byte[4096];
                while ((c = in.read(buf)) != -1) {
                    sos.write(buf, 0, c);
                    size+=buf.length;
                    log.debug("read " + buf.length + " bytes...");
                }
                getResponse().setContentType("text/xml");
                getResponse().addHeader("Content-Length", String.valueOf(size));
                getResponse().setStatus(HttpServletResponse.SC_OK);
                log.debug("before getResponse().flushBuffer()...");
                getResponse().flushBuffer();
                log.debug("after getResponse().flushBuffer()...");
            } finally {
                if (in != null) in.close();
            }
        } finally {
            if (con != null) con.disconnect();
        }
    }
}