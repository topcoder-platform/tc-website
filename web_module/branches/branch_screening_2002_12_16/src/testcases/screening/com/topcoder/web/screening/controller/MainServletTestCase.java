package com.topcoder.web.screening.controller;

import com.topcoder.web.test.*;
import com.topcoder.web.screening.controller.MainServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;


//import com.mockobjects.servlet.MockHttpServletResponse;
//import com.mockobjects.servlet.MockHttpServletRequest;
//import com.mockobjects.util.AssertMo;

import junit.framework.TestCase;
/**
 * JUnit testing for MainServlet
 * @author Mishagam
 * */
public class MainServletTestCase extends TestCase {
	HttpServletRequestHelper request;
	ServletResponseHelper response;
    ServletConfigHelper config;
    ServletContextHelper context;
    HttpSession session;
	
	//MockHttpServletResponse response;
	//MockHttpServletRequest mockRequest;
	MainServlet servlet;
    PrintWriter log;
    
	
	public MainServletTestCase(String name) {
		super(name);
	}
	
	public void setUp() {
		try {
            FileWriter flog = new FileWriter("MainServletTestCase.out");
            log = new PrintWriter(flog);
			log.println("MainServletTestCase setUp started\n");
			request = new HttpServletRequestHelper();
            //request.log = log;
            session = new HttpSessionHelper();
            request.mySession = session;
            request.setParameter("rp", "Logout");
            
			response = new ServletResponseHelper();
			servlet = new MainServlet();
            /*
            Initializing servlet context
             */
            context = new ServletContextHelper();
            config = new ServletConfigHelper();
            config.myContext = context;            
            servlet.init(config);
            log.println("servlet initialized");
		} catch (Exception e) {
			System.out.println("Exception happened: " + e);
		}
	}

    public void testDoPostError() {
        log.println("testDoPost started");
		assertTrue(true);
		log.println("Started doPost test\n");
		try {
            request.setParameter("rp", "WrongRequestProcessorName");
			servlet.doPost((HttpServletRequest)request, (HttpServletResponse)response);
            log.println("servlet.doPost passed");
            RequestDispatcher rd = servlet.getServletContext().getRequestDispatcher("");
            log.println("getRequestDispatcher passed, rd = " + rd);
            RequestDispatcherHelper rdh = (RequestDispatcherHelper)rd;
            log.println("request dispatcher forwardString: " + rdh.forwardString);
            assertEquals(rdh.forwardString, "/errorPage.jsp");
		} catch (Exception e) {
			log.println("Exception in testDoPost:" + e);
			assertTrue(false);
		}
    }
    public void testDoPostOK() {
        log.println("testDoPost started");
		assertTrue(true);
		log.println("Started doPost test\n");
		try {
            request.setParameter("rp", "Logout");
			servlet.doPost((HttpServletRequest)request, (HttpServletResponse)response);
            log.println("servlet.doPost passed");
            RequestDispatcher rd = servlet.getServletContext().getRequestDispatcher("");
            log.println("getRequestDispatcher passed, rd = " + rd);
            RequestDispatcherHelper rdh = (RequestDispatcherHelper)rd;
            log.println("request dispatcher forwardString: " + rdh.forwardString);
            assertEquals(response.myRedirects, "/");
		} catch (Exception e) {
			log.println("Exception in testDoPost:" + e);
			assertTrue(false);
		}
    }
    
    public void tearDown() {
        log.println("finished");
        log.close();
    }       
}
