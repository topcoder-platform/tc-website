package com.topcoder.web.corp.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.util.logging.Logger;

/**
 * My comments/description/notes go here
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class TransactionServlet extends HttpServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    /**
     * status=success will show success page
     * status=failure will show error page
     * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException
    {
        super.doGet(req, resp);
    }
    
    /**
     * mode=begin&amount=NNN.NN will start transaction
     * mode=ack will issued by VeriSign to acknowledge transaction
     * 
     * 200 ok means that transaction was accepted by TC. Thus, VeriSign will
     * complete it. Other return codes will roll transaction back.
     * 
     * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException
    {
        log(req);
        resp.setStatus(HttpServletResponse.SC_OK);
    }
    
    /**
     * Just logs received from VeriSign fields.  
     * @param req
     */
    private void log(HttpServletRequest req) {
        Enumeration e = req.getAttributeNames();
        log.debug("---request attributes---");
        while( e.hasMoreElements() ) {
            String name = (String)e.nextElement();
            log.debug(name+"="+req.getAttribute(name));
        }
        log.debug("---request parameters---");
        e = req.getParameterNames();
        while( e.hasMoreElements() ) {
            String name = (String)e.nextElement();
            String [] params = req.getParameterValues(name);
            log.debug(name+"=");
            for( int i=0; i< params.length; ++i ) {
                log.debug("\t"+params[i]);
            }
        }
        log.debug("---request headers---");
        e = req.getHeaderNames();
        while( e.hasMoreElements() ) {
            String name = (String)e.nextElement();
            log.debug(name+"="+req.getHeader(name));
        }
    }
}
