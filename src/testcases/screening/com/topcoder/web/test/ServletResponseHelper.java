package com.topcoder.web.test;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import junit.framework.Assert;
import java.util.*;
//import com.mockobjects.*;

/** 
 * Helper class implementing HttpServletResponse
 * 
 * @author - mishagam
 * */
public class ServletResponseHelper implements HttpServletResponse {

	private ServletOutputStream myOutputStream = new ServletOutputStreamHelper();
	public int myErrorCode = 0;
	public String myErrorMessage="";
	public String myRedirects = "";
	public List myCookies = new ArrayList();
	int nCookies = 0;
	
    /**
     * MockHttpServletResponse constructor comment.
     */
    public ServletResponseHelper() {
        super();
    }

    public void addCookie(javax.servlet.http.Cookie arg1) {
        myCookies.add(nCookies, arg1);
        nCookies++;
    }

    /**
     * addDateHeader method comment.
     */
    public void addDateHeader(java.lang.String arg1, long arg2) {
    }

    /**
     * addHeader method comment.
     */
    public void addHeader(java.lang.String arg1, java.lang.String arg2) {
    }

    /**
     * addIntHeader method comment.
     */
    public void addIntHeader(java.lang.String arg1, int arg2) {
    }

    public boolean containsHeader(String arg1) {
        //fail("Not implemented");
        return false;
    }

    public String encodeRedirectUrl(String arg1) {
        return arg1;
    }

    public String encodeRedirectURL(String arg1) {
        return arg1;
    }

    public String encodeUrl(String arg1) {
        return arg1;
    }

    public String encodeURL(String arg1) {
        return arg1;
    }

    /**
     * flushBuffer method comment.
     */
    public void flushBuffer() throws java.io.IOException {
    }

    /**
     * getBufferSize method comment.
     */
    public int getBufferSize() {
        return 0;
    }

    public String getCharacterEncoding() {
        //fail("Not implemented");
        return null;
    }

    /**
     * getLocale method comment.
     */
    public java.util.Locale getLocale() {
        return null;
    }

    public javax.servlet.ServletOutputStream getOutputStream()
        throws java.io.IOException {
        return myOutputStream;
    }

    //public String getOutputStreamContents() {
    //    return ((ServletOutputStreamHelper) myOutputStream).getContents();
    //}

    public java.io.PrintWriter getWriter() throws java.io.IOException {
        return new PrintWriter(myOutputStream, true);
    }

    /**
     * isCommitted method comment.
     */
    public boolean isCommitted() {
        return false;
    }

    /**
     * reset method comment.
     */
    public void reset() {
    }

    public void resetBuffer(){
    }

    public void sendError(int anErrorCode) throws java.io.IOException {
        myErrorCode = anErrorCode;
    }

    public void sendError(int anErrorCode, String anErrorMessage)
    throws IOException {
        sendError(anErrorCode);
        myErrorMessage = anErrorMessage;
    }

    public void sendRedirect(String aURL) throws java.io.IOException {
        myRedirects = aURL;
    }

    /**
     * setBufferSize method comment.
     */
    public void setBufferSize(int arg1) {
    }

    public void setContentLength(int arg1) {
        //fail("Not implemented");
    }

    public void setContentType(String contentType) {
        //myContentTypes.addActual(contentType);
    }

    public void setDateHeader(String arg1, long arg2) {
        //fail("Not implemented");
    }

    public void setExpectedContentType(String contentType) {
        //myContentTypes.addExpected(contentType);
    }

    public void setExpectedHeader(String key, String value) {
        //myHeaders.addExpected(new MapEntry(key, value));
    }

    public void setExpectedRedirect(String aURL) throws IOException {
        //myRedirects.addExpected(aURL);
    }

    public void setExpectedSetStatusCalls(int callCount) {
        //mySetStatusCalls.setExpected(callCount);
    }

    public void setHeader(String key, String value) {
        //myHeaders.addActual(new MapEntry(key, value));
    }

    public void setIntHeader(String arg1, int arg2) {
        //Assert.fail("Not implemented");
    }

    /**
     * setLocale method comment.
     */
    public void setLocale(java.util.Locale arg1) {
    }

    public void setStatus(int status) {
        //mySetStatusCalls.inc();
    }

    public void setStatus(int arg1, String arg2) {
        //Assert.fail("Not implemented");
    }

    public void setupOutputStream(ServletOutputStream anOutputStream) {
        myOutputStream = anOutputStream;
    }
}
