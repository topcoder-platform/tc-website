/**
 *
 * Copyright (c) 2008, TopCoder, Inc. All rights reserved
 */
package com.topcoder.web.studio;

import java.sql.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlAnchor;
import com.gargoylesoftware.htmlunit.html.HtmlButton;
import com.gargoylesoftware.htmlunit.html.HtmlCheckBoxInput;
import com.gargoylesoftware.htmlunit.html.HtmlDivision;
import com.gargoylesoftware.htmlunit.html.HtmlElement;
import com.gargoylesoftware.htmlunit.html.HtmlFileInput;
import com.gargoylesoftware.htmlunit.html.HtmlForm;
import com.gargoylesoftware.htmlunit.html.HtmlImage;
import com.gargoylesoftware.htmlunit.html.HtmlImageInput;
import com.gargoylesoftware.htmlunit.html.HtmlInput;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.html.HtmlSelect;
import com.gargoylesoftware.htmlunit.html.HtmlTable;
import com.gargoylesoftware.htmlunit.html.HtmlTableCell;
import com.gargoylesoftware.htmlunit.html.HtmlTableRow;
import com.gargoylesoftware.htmlunit.html.HtmlTextArea;
import com.gargoylesoftware.htmlunit.html.HtmlTextInput;
import com.topcoder.util.config.ConfigManager;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * <p>
 * This test case aggregates all Functional test cases.
 * </p>
 * 
 * @author TCSDEVELOPER
 * @version 1.0
 */
public class FunctionalTests extends TestCase {

	/**
	 * <p>
	 * Represents instance of config manager for test.
	 * </p>
	 */
	private ConfigManager config;

	/**
	 * <p>
	 * Represents namepace of config manager.
	 * </p>
	 */
	private final static String NAMESPACE = "com.myaol.moduleplatform.testing";

	/**
	 * <p>
	 * Sets up test environment.
	 * </p>
	 * 
	 * @throws Exception
	 *             to jUnit.
	 */
	protected void setUp() throws Exception {
		config = ConfigManager.getInstance();
		config.add("config.xml");

	}

	/**
	 * <p>
	 * Clean up test environment.
	 * </p>
	 * 
	 * @throws Exception
	 *             to jUnit.
	 */
	protected void tearDown() throws Exception {
		for (Iterator it = config.getAllNamespaces(); it.hasNext();) {
			String ns = (String) it.next();
			config.removeNamespace(ns);
		}
	}

	/**
	 * <p>
	 * Retrieve the config parameter from the config file.
	 * </p>
	 * 
	 * @param name
	 *            the config parameter name
	 * @return the config parameter value
	 */
	private String getConfigParam(String name) throws Exception {
		return (String) config.getProperty(NAMESPACE, name);
	}

	/**
	 * <p>
	 * Test Case1.
	 * </p>
	 * <p>
	 * Open browser window and type an address like
	 * http://studiodev.topcoder.com
	 * </p>
	 * <p>
	 * The server must respond with a Home page for TopCoder Studio site.
	 * </p>
	 */
	public void test1() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("MAINPAGE_URL"));
		assertEquals(page.getTitleText(), "Welcome to TopCoder Studio");
	}
	
	/**
	 * <p>
	 * Test Case2.
	 * </p>
	 * <p>
	 * TopCoder Query Tool application.
	 * </p>
	 */
	public void test2() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("QUERY_URL"));
		assertEquals(page.getTitleText(), "Query Tool");
	}

	/**
	 * <p>
	 * Test Case3.
	 * </p>
	 * <p>
	 * Log in to Studio
	 * </p>
	 * <p>
	 * The server should respond by the page with your id on the top
	 * </p>
	 */
	public void test3() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("LOGINPAGE_URL"));
		page=login(page,"dok","password");
		HtmlDivision div=(HtmlDivision)page.getHtmlElementById("header_data");
		
		assertTrue(div.asText().indexOf("Hello, dok")>=0);
	}
	
	/**
	 * <p>
	 * Test Case4.
	 * </p>
	 * <p>
	 * View Contest List
	 * </p>
	 * <p>
	 * The server should respond by displaying the Contests page
	 * </p>
	 */
	public void test4() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("MAINPAGE_URL"));
		HtmlAnchor anchor=findAnchorWithText(page, "View All");
		page = (HtmlPage) anchor.click();
		List list=page.getDocumentHtmlElement().getHtmlElementsByTagName("h1");
		HtmlElement element=(HtmlElement)list.get(0);
		assertEquals(element.asText(),"Active Contests");
	}
	/**
	 * <p>
	 * Test Case5.
	 * </p>
	 * <p>
	 * View Contest Details
	 * </p>
	 * <p>
	 * The server should respond by displaying the Contests Details page
	 * </p>
	 */
	public void test5() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("ACTIVECONTEST_URL"));
		
		List list=page.getDocumentHtmlElement().getHtmlElementsByTagName("table");
		HtmlTable element=(HtmlTable)list.get(2);
		list=element.getHtmlElementsByTagName("div");
		
		for(int i=0;i<list.size();i++){
			HtmlDivision div=(HtmlDivision)list.get(i);
			
			if(div.getAttribute("class").equals("contestTitle")){
				
				page = (HtmlPage)( (HtmlAnchor)div.getHtmlElementsByTagName("a").get(0)).dblClick();
				
				HtmlElement header=(HtmlElement)page.getDocumentHtmlElement().getHtmlElementsByTagName("h1").get(0);
				assertEquals("Contest Details",header.asText());
				
				return;
			}
		}
		fail("There is no active contest");
	}
	
	/**
	 * <p>
	 * Test Case6.
	 * </p>
	 * <p>
	 * Login as Admin 
	 * </p>
	 * <p>
	 * The server should respond with the Contest List page with ¡®Add A Contest¡¯ button and ¡®Edit¡¯ buttons next to each contest.
	 * </p>
	 */
	public void test6() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("ADMIN_URL"));
		page=login(page,"dok","password");
		HtmlAnchor a=this.findAnchorWithText(page, "Add contest");
		assertNotNull(a);
		 a=this.findAnchorWithText(page, "edit");
			assertNotNull(a);
	}
	
	/**
	 * <p>
	 * Test Case7.
	 * </p>
	 * <p>
	 * Add a contest 
	 * </p>
	 * <p>
	 * Add a new contest and verify that it shows on the Contest List and Contest Details pages
	 * </p>
	 */
	public void test7() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("ADMIN_URL"));
		page=login(page,"dok","password");
		HtmlAnchor a=this.findAnchorWithText(page, "Add contest");

		 page = (HtmlPage) a.click();
		HtmlInput contestname=(HtmlInput)page.getHtmlElementsByName("ctname").get(0);
		contestname.setValueAttribute("mycontest");
		
	//	HtmlSelect contestType=(HtmlSelect)page.getHtmlElementsByName("ctt").get(0);
	//	contestType.setSelectedAttribute(contestType.getOption(0).asText(),true);
		
		HtmlInput startTime=(HtmlInput)page.getHtmlElementById("sttm");
		startTime.setValueAttribute("2008.12.20 13:00");
		
		HtmlInput endTime=(HtmlInput)page.getHtmlElementById("etm");
		endTime.setValueAttribute("2008.12.25 13:00");
		
		HtmlInput winTime=(HtmlInput)page.getHtmlElementById("watm");
		winTime.setValueAttribute("2008.12.25 13:00");
		
		List list=page.getDocumentHtmlElement().getHtmlElementsByTagName("input");
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i) instanceof HtmlCheckBoxInput){
				HtmlCheckBoxInput checkbox=(HtmlCheckBoxInput)list.get(i);
				checkbox.setChecked(true);
			}
			else if(list.get(i) instanceof HtmlSelect)
			{
				HtmlSelect select=(HtmlSelect)list.get(i);
				if(select.getOptionSize()>0){
					select.setSelectedAttribute(select.getOption(0), true);
				}
			}
		}
		HtmlButton submit=(HtmlButton)page.getHtmlElementsByName("submit").get(0);
		page=(HtmlPage)submit.click();
		assertTrue(page.asText().indexOf("mycontest")>=0);
	}
	
	/**
	 * <p>
	 * Test Case8.
	 * </p>
	 * <p>
	 * Attach Docs to a Contest
	 * </p>
	 */
	public void test8() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("ADMIN_URL"));
		page=login(page,"dok","password");
		HtmlAnchor a=this.findAnchorWithText(page, "Add contest");

		 page = (HtmlPage) a.click();
		
		HtmlForm form= page.getFormByName("addDocumentForm");
		List list=form.getHtmlElementsByTagName("input");
		for(int i=0;i<list.size();i++){
			if(list.get(i) instanceof HtmlFileInput){
				HtmlFileInput file=(HtmlFileInput)list.get(i);
				file.setValueAttribute("c:\\a.pdf");
				break;
			}
		}
		form.submit();
	}
	
	/**
	 * <p>
	 * Test Case9.
	 * </p>
	 * <p>
	 * Set Prize Amounts
	 * </p>
	 */
	public void test9() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("ADMIN_URL"));
		page=login(page,"dok","password");
		HtmlAnchor a=this.findAnchorWithText(page, "Add contest");

		 page = (HtmlPage) a.click();
		HtmlInput contestname=(HtmlInput)page.getHtmlElementsByName("ctname").get(0);
		contestname.setValueAttribute("mycontest");
		
	//	HtmlSelect contestType=(HtmlSelect)page.getHtmlElementsByName("ctt").get(0);
	//	contestType.setSelectedAttribute(contestType.getOption(0).asText(),true);
		
		HtmlInput startTime=(HtmlInput)page.getHtmlElementById("sttm");
		startTime.setValueAttribute("2008.12.20 13:00");
		
		HtmlInput endTime=(HtmlInput)page.getHtmlElementById("etm");
		endTime.setValueAttribute("2008.12.25 13:00");
		
		HtmlInput winTime=(HtmlInput)page.getHtmlElementById("watm");
		winTime.setValueAttribute("2008.12.25 13:00");
		
		List list=page.getDocumentHtmlElement().getHtmlElementsByTagName("input");
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i) instanceof HtmlCheckBoxInput){
				HtmlCheckBoxInput checkbox=(HtmlCheckBoxInput)list.get(i);
				checkbox.setChecked(true);
			}
			else if(list.get(i) instanceof HtmlSelect)
			{
				HtmlSelect select=(HtmlSelect)list.get(i);
				if(select.getOptionSize()>0){
					select.setSelectedAttribute(select.getOption(0), true);
				}
			}
		}
		HtmlForm form= page.getFormByName("addPrizeForm");
		list=form.getHtmlElementsByTagName("input");
		String [] value=new String[]{"1","$300.00"};
		for(int i=0,j=0;i<list.size();i++){
			if(list.get(i) instanceof HtmlTextInput){
				HtmlTextInput text=(HtmlTextInput)list.get(i);
				text.setValueAttribute(value[j++]);
				if(j>=value.length)break;
			}
		}
		form.submit();
		
		
		HtmlButton submit=(HtmlButton)page.getHtmlElementsByName("submit").get(0);
		page=(HtmlPage)submit.click();
		
		HtmlAnchor anchor=this.findAnchorWithText(page, "mycontest");
		page=(HtmlPage)anchor.click();
		assertTrue(page.asText().indexOf("$300.00")>=0);
	}
	
	/**
	 * <p>
	 * Test Case10.
	 * </p>
	 * <p>
	 * Register for a Contest
	 * </p>
	 * 
	 * <p>
	 * Verify that the Submit and Rank button replaces the Register button.
	 * </p>
	 */
	public void test10() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("ACTIVECONTEST_URL_2"));
		HtmlAnchor a=this.findAnchorWithText(page, "Register");
		page = (HtmlPage) a.click();
		
		List list=page.getDocumentHtmlElement().getHtmlElementsByTagName("input");
		for(int i=0;i<list.size();i++)
		{
			if(list.get(i) instanceof HtmlCheckBoxInput){
				HtmlCheckBoxInput checkbox=(HtmlCheckBoxInput)list.get(i);
				checkbox.setChecked(true);
			}
			else if(list.get(i) instanceof HtmlImageInput){
				HtmlImageInput image=(HtmlImageInput)list.get(i);
			    image.click();
			    break;
			}
		}
		page = (HtmlPage) webClient
		.getPage(getConfigParam("ACTIVECONTEST_URL_2"));
		assertNotNull(this.findAnchorWithText(page,"Submit & Organize"));
	}
	
	/**
	 * <p>
	 * Test Case11.
	 * </p>
	 * <p>
	 * Download Documents
	 * </p>
	 * 
	 * <p>
	 * Verify that the Submit and Rank button replaces the Register button.
	 * </p>
	 */
	public void test11() throws Exception {
		WebClient webClient = new WebClient();
		HtmlPage page = (HtmlPage) webClient
				.getPage(getConfigParam("ACTIVECONTEST_URL"));
		
		List list=page.getDocumentHtmlElement().getHtmlElementsByTagName("table");
		HtmlTable element=(HtmlTable)list.get(2);
		list=element.getHtmlElementsByTagName("div");
		
		for(int i=0;i<list.size();i++){
			HtmlDivision div=(HtmlDivision)list.get(i);
			
			if(div.getAttribute("class").equals("contestTitle")){
				
				page = (HtmlPage)( (HtmlAnchor)div.getHtmlElementsByTagName("a").get(0)).dblClick();
				
				list=page.getDocumentHtmlElement().getHtmlElementsByTagName("div");
				HtmlDivision d=null;
				for(int j=0;j<list.size();j++){
					d=(HtmlDivision) list.get(j);
					if(d.asText().equals("Downloads:"))
					{
						d=(HtmlDivision) list.get(j+1);
						break;
					}
				}
				list=d.getHtmlElementsByTagName("a");
				
				if(0<list.size()){
					HtmlAnchor anchor=(HtmlAnchor) list.get(0);
					
					Page doc=anchor.click();
					
				}
				return;
			}
		}
		fail("There is no active contest");
    }
	/**
     * <p>
     * login into the given page by the given account.
     * </p>
     * 
     * @param loginPage
     *            the login page
     * @param userName
     *            the login name
     * @param pass
     *            the login name
     */
    private HtmlPage login(HtmlPage loginPage, String userName, String pass) throws Exception {
    	
    	HtmlForm loginFrm=loginPage.getFormByName("frmLogin");
    	
        List list = loginFrm
                .getHtmlElementsByTagName("input");
        for(int i=0;i<list.size();i++){
        	HtmlInput input=(HtmlInput) list.get(i);
        	if(input.getTypeAttribute().equals("text")){
        		input.setValueAttribute(userName);
        	}
        	else if(input.getTypeAttribute().equals("password")){
        		input.setValueAttribute(pass);
        		break;
        	}
        }
        return (HtmlPage)loginFrm.submit();
    }
    /**
     * <p>
     * find the given anchor by the text.
     * </p>
     * 
     * @param page
     *            the request anchor locate
     * @param text
     *            the anchor name
     * @return the request anchor ,if not found, return null
     */
    private HtmlAnchor findAnchorWithText(HtmlPage page, String text) {
        List list = page.getAnchors();
        for (int i = 0; i < list.size(); i++) {
            HtmlAnchor anchor = (HtmlAnchor) list.get(i);
            
            if (text.equals(anchor.asText())
            	) {
                // System.err.println(anchor.getHrefAttribute());
                return anchor;
            }
            List imglist=anchor.getHtmlElementsByTagName("img");
            for(int j=0;j<imglist.size();j++){
            	HtmlElement img=(HtmlElement) imglist.get(0);
            	if(text.equals(img.getAttribute("alt")))return anchor;
            }
        }
        return null;
    }

	/**
	 * Aggregate all tests.
	 * 
	 * @return the test suite.
	 */
	public static Test suite() {
		final TestSuite suite = new TestSuite(FunctionalTests.class);

		return suite;
	}

}
