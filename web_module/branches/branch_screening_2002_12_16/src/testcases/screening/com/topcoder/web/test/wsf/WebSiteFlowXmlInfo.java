package com.topcoder.web.test.wsf;

import junit.framework.TestCase;
import javax.servlet.*;

// imports for HTTP testing
import java.net.*;
import java.io.*;
import java.util.regex.*;
import java.util.*;
import java.util.zip.DataFormatException;

import com.meterware.httpunit.*;
import org.xml.sax.*;
import org.w3c.dom.*;
// import for reading xml
import javax.xml.parsers.*;

/**
 * class for testing Web flow for screening site
 * using data from WebSiteFlowTest.xml
 * 
 * @author Mishagam
 * created 1/13/2003
 * renamed and moved to WebSiteFlowXmlInfo 1/18/2003
 * */
public class WebSiteFlowXmlInfo {

	String xmlFileName = "resources/screening/WebSiteFlowTest.xml";
	Map parameters = new HashMap();
	Document doc = null;
	Map pages = new HashMap(); 
	
	public WebSiteFlowXmlInfo() {
	}
	
	WsfPage getPageByName(String name) {
		WsfPage p = (WsfPage)pages.get(name);
		return p;
	}
	
	boolean readParameters() {
		readFromXml();
		Element root = doc.getDocumentElement();
		NodeList nl = root.getElementsByTagName("parameters");

		Element param = (Element)nl.item(0);
		NodeList params = param.getChildNodes();
		System.out.println("Read Parameter, params.getlength() = " + params.getLength());
		for (int i=0; i<params.getLength(); i++) {
			Node n = params.item(i);
			if (n.getNodeType() == Node.ELEMENT_NODE) {
				// reading parameter
				Element el = (Element)n;
				String name = el.getTagName();
				String value = null;
				Node valNode = el.getFirstChild();
				if (valNode.getNodeType() == Node.TEXT_NODE) {
					value = valNode.getNodeValue();
				}
				parameters.put(name, value);				
			}
		}
		
		return true;
	}
	
	WsfPattern [] readPagePatterns(Element el) throws DataFormatException {
		List pats = new ArrayList();
		NodeList nl = el.getChildNodes();
		for (int i = 0; i < nl.getLength(); i++) {
			Node n = nl.item(i);
			if (n.getNodeType() == Node.ELEMENT_NODE) {
				// adding one more pattern
				Element pel = (Element)n;
				WsfPattern p = new WsfPattern();
				if (pel.getTagName().equals("text-pattern")) {
					p.type = WsfPattern.TEXT_PATTERN;					
				} else if (pel.getTagName().equals("re-pattern")) {
					p.type = WsfPattern.RE_PATTERN;	
				} else {
					throw new DataFormatException("Wrong pattern type" + p.type);
				}
				Node nval = pel.getFirstChild();				
				p.value = nval.getNodeValue();	
				pats.add(p);			
			}
		}
		WsfPattern []retPats = new WsfPattern[0];
		retPats= (WsfPattern [])pats.toArray(retPats);
		return retPats;
	}
	
	WsfLink readOneLink(Element el) throws DataFormatException {
		WsfLink l = new WsfLink();
		NodeList nl = el.getChildNodes();
		for (int i=0; i < nl.getLength(); i++) {
			if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
				Element e = (Element)nl.item(i);
				String name = e.getTagName();
				String val;
				Node valNode = e.getFirstChild();
				if (valNode == null) {
					val = null;
				} else {
					if (valNode.getNodeType() != Node.TEXT_NODE) {
						throw new DataFormatException("Wrong Link format in readOneLink: Node type = " + valNode.getNodeType() +
						  	" instead of TEXT_NODE");
					}
					val = valNode.getNodeValue();
				}
				if (name.equals("with-text")) {
					l.pattern = val;
				} else if (name.equals("url")) {
					l.targetUrl = val;
				} else if (name.equals("target-name")) {
					l.targetPageName = val;
				} else {
					throw new DataFormatException("Wrong link field name in readOneLink(): " + name);
				}				
			}
		}
		return l;		
	}
	/**
	 * reading link child nodes of element el in returned array
	 * */
	WsfLink [] readLinks(Element el) throws DataFormatException {
		List links = new ArrayList();
		NodeList nl = el.getChildNodes();
		for (int i=0; i < nl.getLength(); i++) {
			if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
				WsfLink l = readOneLink((Element)nl.item(i));
				links.add(l);
			}
		}
		
		WsfLink []retLinks = new WsfLink[0];
		retLinks = (WsfLink[])links.toArray(retLinks);
		return retLinks;
	}
	
	private WsfPage readOnePage(Element el) throws DataFormatException {
		NodeList nl = el.getChildNodes();
		WsfPage page = new WsfPage();
		
		// reading name attribute
		page.name = el.getAttribute("name");
		
		for (int i = 0; i < nl.getLength(); ++i) {
			if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
				Element part_el = (Element)nl.item(i);
				String part = part_el.getTagName();
				if (part.equals("httpurl")) {
					// reading url
					Node n = part_el.getFirstChild();
					page.url = n.getNodeValue().trim();
				} else if (part.equals("identification")) {
					// reading identifications
					WsfPattern[] pats = readPagePatterns(part_el);
					page.patterns = pats;
					//page.url = n.getNodeValue();
				} else if (part.equals("links")) {
					WsfLink[] links = readLinks(part_el);
					page.links = links;
					// reading links
				}				
			}			
		}
		return page;
		 
	}
	
	void readPages() throws DataFormatException {
		readFromXml();
		NodeList nlPages = doc.getElementsByTagName("page");

		System.out.println("pages.getlength() = " + nlPages.getLength());
		for (int i=0; i<nlPages.getLength(); i++) {
			System.out.println("Node: " + i 
				+ " name " + nlPages.item(i).getNodeName() 
				+ " Node_Type " + nlPages.item(i).getNodeType());			
			Element el = (Element)nlPages.item(i);
			WsfPage page = readOnePage(el);
			pages.put(page.name, page);
		}
	}
	
	public void init() throws DataFormatException {
		this.readParameters();
		this.readPages();
	}
	
	public boolean readFromXml() {
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
