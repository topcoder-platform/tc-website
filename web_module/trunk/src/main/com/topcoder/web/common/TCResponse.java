package com.topcoder.web.common;

import javax.servlet.http.Cookie;
import javax.servlet.ServletOutputStream;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Locale;

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

    void flushBuffer();

}
