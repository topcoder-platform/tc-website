package com.topcoder.web.winformula.controller.request;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.web.common.BaseProcessor;

/**
 */
public class RSSFeed extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        //stream it out via the response
//        getResponse().addHeader("content-disposition", "inline; filename=\"" + d.getOriginalFileName() + "\"");
//        getResponse().setContentType(d.getMimeType().getDescription());

        ServletOutputStream sos = getResponse().getOutputStream();

        URL p = new URL("http://topcoderblogs.com/winningformula/?feed=rss2");
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
                    sos.write(c);
                    size+=buf.length;
                }
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