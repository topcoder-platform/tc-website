package com.topcoder.web.test;

import javax.servlet.*;
import javax.servlet.http.*;
import junit.framework.Assert;
import java.util.*;

import org.w3c.dom.*;
import org.xml.sax.*;
// import for reading xml
import javax.xml.parsers.*;
import java.io.*;

/**
 * Helper class implementing ServletConfig interface
 * functionality - for testing purposes can hold parameter map and context
 * also reads web.xml file so I can use Constants class
 * 
 * @author - mishagam
 * */
public class ServletConfigHelper implements ServletConfig {
    public HashMap parameterMap;
    public ServletContext myContext;
    String myName = "ServletConfigHelper";
	Document doc = null;


    public ServletConfigHelper() {
        parameterMap = new HashMap();
        // myContext = 
        parameterMap.put("error_page","/errorPage.jsp");
        parameterMap.put("request_processor_parameter","rp");
        parameterMap.put("valid_char_list","abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_");
        parameterMap.put("processors_package","com.topcoder.web.screening.request");
    }
     /**
     * Returns a String containing the value of the named initialization 
     * parameter, or null if the parameter does not exist.  
     */
    public String getInitParameter(String name) {
        return (String)parameterMap.get(name);
    }
    /**
     * Returns the names of the servlet's initialization parameters as 
     * an Enumeration of String objects, or an empty Enumeration if 
     * the servlet has no initialization parameters.
     */
    public Enumeration getInitParameterNames() {
        Vector v = new Vector(parameterMap.keySet());
        return v.elements();
    }
    
    /**
     * Returns a reference to the ServletContext in which the caller is executing.
     */
    public ServletContext getServletContext() {
        return myContext;
    }
    
    /**
     * Returns the name of this servlet instance.
     */    
    public String getServletName() {
        return myName;        
    }
    
    /**
     * reads web xml so I can use Constants class
     * */
    public void readWebXmlParameters(String xmlFileName) {    	
		readFromXml(xmlFileName);
		NodeList nlParms = doc.getElementsByTagName("init-param");

		System.out.println("pages.getlength() = " + nlParms.getLength());
		for (int i=0; i<nlParms.getLength(); i++) {
			Element el = (Element)nlParms.item(i);
			readOneParameter(el);
		}
	}
	
	/**
	 * reads one parameter from web.xml 
	 * and adds it to parameterMap
	 * */    
    void readOneParameter(Element el) {
		NodeList nl = el.getChildNodes();
		String pName=null;
		String pValue=null;

		for (int i=0; i < nl.getLength(); i++) {
			if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
				Element e = (Element)nl.item(i);
				String name = e.getTagName();
				String sval = null;
				Node valNode = e.getFirstChild();
				if 	((valNode != null) && 
				    	(valNode.getNodeType() == Node.TEXT_NODE)) {
					sval = valNode.getNodeValue();
				}
				if (name.equals("param-name")) {
					pName = sval;
				} else if (name.equals("param-value")) {
					pValue = sval;
				}
			}
		}
		if (pName!=null && pValue != null) {
			System.out.println("Read parameter " + pName + " = " + pValue);
			parameterMap.put(pName, pValue);
		}	
	}
  
    /**
     * reading doc from xml file
     * */    
	boolean readFromXml(String xmlFileName) {
		if (doc!=null) {
			return true; // we already read
		}
		try {
			FileReader sr = new FileReader(xmlFileName);
			InputSource is = new InputSource(sr);
			// parse XML
			DocumentBuilderFactory fact = DocumentBuilderFactory.newInstance();
			fact.setValidating(false);
			DocumentBuilder builder = fact.newDocumentBuilder();
			doc = builder.parse(is);
		} catch(Exception e) {
			System.out.println("Excepton in WebSiteFlowTest.ReadFromXml(): " + e);
			e.printStackTrace();
			doc = null;
			return false;
		}
		
		return true;		
	}

}