package com.topcoder.web.common;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author dok
 * Date: Jan 17, 2004
 */
public interface TCResponse {

    void addCookie(Cookie cookie);

    String encodeRedirectURL(String url);

    String encodeURL(String url);

    void sendRedirect(String location) throws IOException;

    ServletOutputStream getOutputStream() throws IOException;

    PrintWriter getWriter() throws IOException;

    boolean isCommitted();

    void setContentType(String type);

    void flushBuffer() throws IOException;

    void addHeader(String header, String val);

    void setStatus(int i);
}
