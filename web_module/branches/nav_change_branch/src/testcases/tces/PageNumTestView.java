import com.meterware.httpunit.*;
import org.xml.sax.SAXException;
import java.io.*;
import java.util.*;


/**
 * Test page flow using class PageNumTest. 
 * This is a independent app as oppose to PageNumTestCase. 
 * Running this will create log output in an html file.
 * For Node #, view class PageNumTest or "_site_flow.gif" in docs\tces 
 * Run time: approx 3 min
 *
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/28/2002
 *
 */
public class PageNumTestView{
	// main method 
	public static void main(String args[]) {
		System.out.println("PageNumTestView running.");
		String fileName = pageNumTest();
		if (fileName != null){
			System.out.println("PageNumTestView successful.");
			System.out.println("View File at: "+fileName);
		}else{
			System.out.println("PageNumTestView failed.");
		}
	}


	public static String pageNumTest() {
		try{
			TestMessage.clearMessage();
			long fileId = System.currentTimeMillis();
			String beginTime = "Start Time: " + getCurrentTime();

			testNodes();

			String endTime = "End Time: " + getCurrentTime();

			String fileName = "result"+File.separatorChar+"PageNumTest"+fileId+".html";
			PrintWriter out = new PrintWriter(new FileOutputStream(fileName));
			out.print(beginTime+"<br>"+endTime+"<br>" + TestMessage.getTitle() + 
					"<br><br><br>" + TestMessage.getMessage());
			out.flush();	out.close();
			return fileName;
		}catch(IOException ioe){}
		return null;
	}

	private static void testNodes(){
		TestMessage.addTitleMessage("TESTING NODES");
		try{
			PageNumTest pnt;
		// Test node: 3 & up - page 3 guarantees flow of page 1, 2

			TestMessage.addSubTitleMessage("TESTING NODES: 3");
			PageNumTest.checkResponse((new PageNumTest()).campaignDetailTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 4");
			PageNumTest.checkResponse((new PageNumTest()).campaignInterestTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 5");
			PageNumTest.checkResponse((new PageNumTest()).positionInterestTask());	

			//	6 thru 4 & 5
			TestMessage.addSubTitleMessage("TESTING NODES: 6 thru 4");
			pnt = new PageNumTest();	pnt.setFrom_4_5(4);			
			PageNumTest.checkResponse(pnt.overallDemographicInfoTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 6 thru 5");
			pnt = new PageNumTest();	pnt.setFrom_4_5(5);			
			PageNumTest.checkResponse(pnt.overallDemographicInfoTask());	

			//	7 thru 4 & 5
			TestMessage.addSubTitleMessage("TESTING NODES: 7 thru 4");
			pnt = new PageNumTest();	pnt.setFrom_4_5(4);			
			PageNumTest.checkResponse(pnt.memberProfileTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 7 thru 5");
			pnt = new PageNumTest();	pnt.setFrom_4_5(5);			
			PageNumTest.checkResponse(pnt.memberProfileTask());	

/*
			TestMessage.addSubTitleMessage("TESTING NODES: 8");
			PageNumTest.checkResponse((new PageNumTest()).individualDemographicInfoTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 9");
			PageNumTest.checkResponse((new PageNumTest()).competitionHistoryTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 10");
			PageNumTest.checkResponse((new PageNumTest()).problemSubmissionTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 11");
			PageNumTest.checkResponse((new PageNumTest()).ratingHistoryTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 12");
			PageNumTest.checkResponse((new PageNumTest()).overallRatingDistributionGraphTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 13");
			PageNumTest.checkResponse((new PageNumTest()).competitionStatisticsTask());	

			//	14 thru 10 & 13
			TestMessage.addSubTitleMessage("TESTING NODES: 14 thru 10");
			pnt = new PageNumTest();	pnt.setFrom_10_13(10);			
			PageNumTest.checkResponse(pnt.problemStatisticsTask());	
			TestMessage.addSubTitleMessage("TESTING NODES: 14 thru 13");
			pnt = new PageNumTest();	pnt.setFrom_10_13(13);			
			PageNumTest.checkResponse(pnt.problemStatisticsTask());	

			TestMessage.addSubTitleMessage("TESTING NODES: 15");
			PageNumTest.checkResponse((new PageNumTest()).problemStatementTask());	

			TestMessage.addSubTitleMessage("TESTING NODES: 16");
			PageNumTest.checkResponse((new PageNumTest()).memberInterestTask());	
*/
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}


	private static String getCurrentTime(){
		return Calendar.getInstance().getTime().toString();
	}

}// end class RunTest


