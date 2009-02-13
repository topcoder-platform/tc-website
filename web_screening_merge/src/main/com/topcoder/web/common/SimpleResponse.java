package com.topcoder.web.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.util.Locale;
import java.io.PrintWriter;
import java.io.IOException;

/**
 * @author dok
 * Date: Jan 17, 2004
 */
public class SimpleResponse implements TCResponse {

    private HttpServletResponse response = null;

    public SimpleResponse(HttpServletResponse response) {
        this.response = response;
    }

    public void addCookie(Cookie cookie) {
        response.addCookie(cookie);
    }

    public String encodeRedirectURL(String url) {
        return response.encodeRedirectURL(url);
    }

    public String encodeURL(String url) {
        return response.encodeURL(url);
    }

    public void sendRedirect(String location) throws IOException {
        response.sendRedirect(location);
    }

    public ServletOutputStream getOutputStream() throws IOException {
        return response.getOutputStream();
    }

    public PrintWriter getWriter() throws IOException {
        return response.getWriter();
    }

    public boolean isCommitted() {
        return response.isCommitted();
    }

    public void setContentType(String type) {
        response.setContentType(type);
    }

    public void flushBuffer() throws IOException {
        response.flushBuffer();
    }

    public void addHeader(String header, String val) {
        response.addHeader(header, val);
    }

    public void setStatus(int i) {
        response.setStatus(i);
    }

}
