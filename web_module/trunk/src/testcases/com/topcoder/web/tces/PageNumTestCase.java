import junit.framework.*;
import com.meterware.httpunit.*;
import org.xml.sax.SAXException;
import java.io.*;
import java.util.*;


/**
 * Test page flow using class PageNumTest. 
 * This is a TestCase to be run under JUnit. 
 * For Node #, view class PageNumTest or "_site_flow.gif" in docs\tces 
 * Run time: approx 3 min
 *
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/28/2002
 *
 */
public class PageNumTestCase extends TestCase  {

	public PageNumTestCase(String name) {
		super(name);
	}


	// Test node: 3 & up - page 3 guarantees flow of page 1, 2

	public void testNode3(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).campaignDetailTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode4(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).campaignInterestTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode5(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).positionInterestTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode6thru4(){
		try{
			TestMessage.clearMessage(true,false);
			PageNumTest pnt = new PageNumTest();	
			pnt.setFrom_4_5(4);			
			WebResponse resp = pnt.overallDemographicInfoTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode6thru5(){	// other path
		try{
			TestMessage.clearMessage(true,false);
			PageNumTest pnt = new PageNumTest();	
			pnt.setFrom_4_5(5);			
			WebResponse resp = pnt.overallDemographicInfoTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode7thru4(){	// other path
		try{
			TestMessage.clearMessage(true,false);
			PageNumTest pnt = new PageNumTest();	
			pnt.setFrom_4_5(4);			
			WebResponse resp = pnt.memberProfileTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode7thru5(){	// other path
		try{
			TestMessage.clearMessage(true,false);
			PageNumTest pnt = new PageNumTest();	
			pnt.setFrom_4_5(5);			
			WebResponse resp = pnt.memberProfileTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}
/*
	public void testNode8(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).individualDemographicInfoTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode9(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).competitionHistoryTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode10(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).problemSubmissionTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode11(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).ratingHistoryTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode12(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).overallRatingDistributionGraphTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode13(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).competitionStatisticsTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode14thru10(){// other path
		try{
			TestMessage.clearMessage(true,false);
			PageNumTest pnt = new PageNumTest();	
			pnt.setFrom_10_13(10);			
			WebResponse resp = pnt.problemStatisticsTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode14thru13(){// other path
		try{
			TestMessage.clearMessage(true,false);
			PageNumTest pnt = new PageNumTest();	
			pnt.setFrom_10_13(13);			
			WebResponse resp = pnt.problemStatisticsTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode15(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).problemStatementTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	public void testNode16(){
		try{
			TestMessage.clearMessage(true,false);
			WebResponse resp = (new PageNumTest()).memberInterestTask();
			PageNumTest.checkResponse(resp);
			assertTrue(TestMessage.getMessage(), !PageNumTest.hasError(resp));
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}

	*/
}



