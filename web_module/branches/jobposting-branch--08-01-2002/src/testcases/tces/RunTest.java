import com.meterware.httpunit.*;
import org.xml.sax.SAXException;
import java.io.*;
import java.util.*;


/**
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/27/2002
 *
 */
public class RunTest{
	// main method 
	public static void main(String args[]) {
		pageNumTest();
	}


	public static void pageNumTest() {
		try{
			TestMessage.clearMessage();
			long fileId = System.currentTimeMillis();
			String beginTime = "Start Time: " + getCurrentTime();
			pageNumTestEndNode();
			pageNumTestMultPathNode();
			String endTime = "End Time: " + getCurrentTime();

			PrintWriter out = new PrintWriter(new FileOutputStream("result"+File.separatorChar+"PageNumTest"+fileId+".html"));
			out.print(beginTime+"<br>"+endTime+"<br>"+TestMessage.getMessage());
			out.flush();	out.close();
		}catch(IOException ioe){}
	}

	//		PageNumTest.setShowTableDetail(true);
	private static void pageNumTestEndNode(){
		TestMessage.addTitleMessage("TESTING END-NODES");
		try{
		// Test end-node: 6, 8, 11, 12, 15
			TestMessage.addSubTitleMessage("TESTING END-NODES: 6");
			TestMessage.checkResponse((new PageNumTest()).overallDemographicInfoTask());	
			TestMessage.addSubTitleMessage("TESTING END-NODES: 8");
			TestMessage.checkResponse((new PageNumTest()).individualDemographicInfoTask());	
			TestMessage.addSubTitleMessage("TESTING END-NODES: 11");
			TestMessage.checkResponse((new PageNumTest()).ratingHistoryTask());	
			TestMessage.addSubTitleMessage("TESTING END-NODES: 12");
			TestMessage.checkResponse((new PageNumTest()).overallRatingDistributionGraphTask());	
			TestMessage.addSubTitleMessage("TESTING END-NODES: 15");
			TestMessage.checkResponse((new PageNumTest()).problemStatementTask());	
		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}
	private static void pageNumTestMultPathNode(){
		TestMessage.addTitleMessage("TESTING MULT-PATH-NODES");
		try{
		// Test mult-path-node
			PageNumTest pnt;
			//	6 thru 4 & 5
			TestMessage.addSubTitleMessage("TESTING MULT-PATH-NODES: 6 thru 4");
			pnt = new PageNumTest();	pnt.setFrom_4_5(4);			
			TestMessage.checkResponse(pnt.overallDemographicInfoTask());	
			TestMessage.addSubTitleMessage("TESTING MULT-PATH-NODES: 6 thru 5");
			pnt = new PageNumTest();	pnt.setFrom_4_5(5);			
			TestMessage.checkResponse(pnt.overallDemographicInfoTask());	

			//	7 thru 4 & 5
			TestMessage.addSubTitleMessage("TESTING MULT-PATH-NODES: 7 thru 4");
			pnt = new PageNumTest();	pnt.setFrom_4_5(4);			
			TestMessage.checkResponse(pnt.memberProfileTask());	
			TestMessage.addSubTitleMessage("TESTING MULT-PATH-NODES: 7 thru 5");
			pnt = new PageNumTest();	pnt.setFrom_4_5(5);			
			TestMessage.checkResponse(pnt.memberProfileTask());	

			//	14 thru 13 & 10
			TestMessage.addSubTitleMessage("TESTING MULT-PATH-NODES: 14 thru 10");
			pnt = new PageNumTest();	pnt.setFrom_10_13(10);		
			TestMessage.checkResponse(pnt.problemStatisticsTask());	
			TestMessage.addSubTitleMessage("TESTING MULT-PATH-NODES: 14 thru 13");
			pnt = new PageNumTest();	pnt.setFrom_10_13(13);		
			TestMessage.checkResponse(pnt.problemStatisticsTask());	

		}catch(org.xml.sax.SAXException se){
		}catch(IOException ioe){
		}
	}


	private static String getCurrentTime(){
		return Calendar.getInstance().getTime().toString();
	}

}// end class RunTest


