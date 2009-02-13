package com.topcoder.web.test.wsf;

import junit.framework.TestCase;
//import javax.servlet.*;

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
	//String xmlFileName = "MisFlow.xml";
	Map parameters = new HashMap();
	Document doc = null;
	Map pages = new HashMap(); 
	Map paths = new HashMap();
	
	public WebSiteFlowXmlInfo() {
	}
	
	WsfPage getPageByName(String name) {
		WsfPage p = (WsfPage)pages.get(name);
		return p;
	}
	
	WsfPath getPathByName(String name) {
		WsfPath p = (WsfPath)paths.get(name);
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
	
	WsfFormParam readFormParameter(Element el) throws DataFormatException {
		WsfFormParam p = new WsfFormParam();
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
				if (name.equals("name")) {
					p.name = val;
				} else if (name.equals("value")) {
					p.value = val;
				} else {
					throw new DataFormatException("Wrong Form Parameter field");
				}				
			}
		}
		
		return p;
	}
	/*
	 * reading one WsfForm
	 * */
	WsfForm readOneForm(Element el) throws DataFormatException {
		WsfForm f = new WsfForm();
		NodeList nl = el.getChildNodes();
		List parms = new ArrayList();
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
				if (name.equals("index")) {
					f.index = Integer.parseInt(sval);
				} else if (name.equals("submit-button-name")) {
					f.submitName = sval;
				} else if (name.equals("target-name")) {
					f.targetPageName = sval;
				} else if (name.equals("parameter")) {
					// reading parameters
					WsfFormParam parm = readFormParameter(e);
					parms.add(parm);
				}				
			}
		}
		f.params = new WsfFormParam[0];
		f.params = (WsfFormParam[]) parms.toArray(f.params);
		return f;		
	}
	 
	/**
	 * reading link child nodes of element el in returned array
	 * */
	WsfForm [] readForms(Element el) throws DataFormatException {
		List forms = new ArrayList();
		NodeList nl = el.getChildNodes();
		for (int i=0; i < nl.getLength(); i++) {
			if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
				Element form_el = (Element)nl.item(i);
				WsfForm f = readOneForm(form_el);
				forms.add(f);
			}
		}
		
		WsfForm []retForms = new WsfForm[0];
		retForms = (WsfForm[])forms.toArray(retForms);
		return retForms;
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
					if (n == null) {
						page.url = null; 
					} else {
						page.url = n.getNodeValue().trim();
					}
				} else if (part.equals("identification")) {
					// reading identifications
					WsfPattern[] pats = readPagePatterns(part_el);
					page.patterns = pats;
					//page.url = n.getNodeValue();
				} else if (part.equals("links")) {
					WsfLink[] links = readLinks(part_el);
					page.links = links;
					// reading links
				} else if (part.equals("forms")) {
					// reading forms
					WsfForm[] forms = readForms(part_el);
					page.forms = forms;
				} else {
					throw new DataFormatException("Wrong field in page: " + part);
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
	
	WsfStep readOneStep(Element el) throws DataFormatException {
		WsfStep step = new WsfStep(); 
		String type = el.getAttribute("type");
		
		step.type = type;
		if (type.equals("start") || type.equals("finish")) {
			// value is page name
			Node n = el.getFirstChild();
			if (n.getNodeType() != Node.TEXT_NODE) {
				throw new DataFormatException("Wrong node type for start or finish = " 
						+ n.getNodeType());
			} 
			String s = n.getNodeValue();
			step.val = s;						
		} else if (type.equals("link")) {
			// reading link
			NodeList nel = el.getElementsByTagName("link");
			Element eel = (Element)nel.item(0);
			WsfLink link = readOneLink(eel);
			step.val = link;			
		} else if (type.equals("form")) {
			// reading link
			NodeList nel = el.getElementsByTagName("form");
			Element eel = (Element)nel.item(0);
			WsfForm form = readOneForm(eel);
			step.val = form;			
		} else {
			throw new DataFormatException("Wrong step type: " + type);
		}
		
		return step;
	}
	
	WsfPath readOnePath(Element el) throws DataFormatException {
		WsfPath path = new WsfPath();
		List steps = new ArrayList();
		NodeList nl = el.getChildNodes();
		path.name = el.getAttribute("name");
		
		for (int i = 0; i < nl.getLength(); ++i) {
			if (nl.item(i).getNodeType() == Node.ELEMENT_NODE) {
				Element part_el = (Element)nl.item(i);
				String part = part_el.getTagName();
				if (!part.equals("step")) {
					throw new DataFormatException("Wrong element in path: " + part);
				}
				
				WsfStep step = readOneStep(part_el);
				steps.add(step);
			}			
		}
		path.steps = new WsfStep[0];
		path.steps = (WsfStep[])steps.toArray(path.steps);
		return path;
	}
	
	void readPaths() throws DataFormatException {
		NodeList nlPaths = doc.getElementsByTagName("path");

		System.out.println("pages.getlength() = " + nlPaths.getLength());
		for (int i=0; i<nlPaths.getLength(); i++) {
			System.out.println("Node: " + i 
				+ " name " + nlPaths.item(i).getNodeName() 
				+ " Node_Type " + nlPaths.item(i).getNodeType());			
			Element el = (Element)nlPaths.item(i);
			WsfPath path = readOnePath(el);
			paths.put(path.name, path);
		}
	}
	
	public void init() throws DataFormatException {
		this.readParameters();
		this.readPages();
		this.readPaths();
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
