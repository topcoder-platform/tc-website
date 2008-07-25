package com.topcoder.web.winformula.controller.request;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import sun.misc.BASE64Encoder;

import com.topcoder.web.common.BaseProcessor;

/**
 */
public class RSSFeeder extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        String feed = null;
        if (hasParameter("feed")) {
            feed = getRequest().getParameter("feed");
        }

        ServletOutputStream sos = getResponse().getOutputStream();

        String pass = new BASE64Encoder().encode("alexdelarge:cl0ckw0rk".getBytes());

        String[] urls = {"http://topcoderblogs.com/winningformula/?feed=rss", 
                         "http://www.dev.topcoder.com/winformula/forums?module=RSS&categoryID=1", 
                         "http://sports.espn.go.com/espn/rss/ncf/news"}; 
        
        getResponse().setContentType("text/xml");
        getResponse().setStatus(HttpServletResponse.SC_OK);
        
        feedURLS(urls, new String[] {null, pass, null});
    }

    private void feedURLS(String[] urls, String[] pass) throws IOException, TransformerException {
        PrintWriter out = getResponse().getWriter();
        TransformerFactory tFactory =  TransformerFactory.newInstance();

        Source xslSource = new StreamSource(getClass().getResourceAsStream("/rss.xsl"));

        Transformer transformer = tFactory.newTransformer(xslSource);
        for (int i = 0; i < urls.length; i++) {
            URL p = new URL(urls[i]);
            HttpURLConnection con = null;
            con = (HttpURLConnection) p.openConnection();
            try {
                if (pass[i] != null) {
                    con.setRequestProperty("Authorization", "Basic " + pass[i]);
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
}