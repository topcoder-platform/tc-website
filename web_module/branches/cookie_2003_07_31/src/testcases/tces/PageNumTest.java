
import com.meterware.httpunit.*;
import com.meterware.httpunit.HttpInternalErrorException;
import org.xml.sax.SAXException;
import java.io.*;


/**
 * Tests flow of site. Each method represent a different page and will call all 
 * methods for pages before it to check all links leading to the page. Since 
 * there could be more than one path to a page, the actual path can be determine 
 * by setting the "from_x_x variables". When getting link from data table, 
 * always use link in first row.
 * Used by PageNumTestView(application) and PageNumTestCase(JUnit TestCase).
 * 
 * For Node #, view below or "_site_flow.gif" in docs\tces 
 *		page 1 - loginTask
 *		page 2 - mainTask
 *		page 3 - campaignDetailTask
 *		page 4 - campaignInterestTask
 *		page 5 - positionInterestTask
 *		page 6 - overallDemographicInfoTask
 *		page 7 - memberProfileTask
 *		page 8 - individualDemographicInfoTask
 *		page 9 - competitionHistoryTask
 *		page 10 - problemSubmissionTask
 *		page 11 - ratingHistoryTask
 *		page 12 - overallRatingDistributionGraphTask
 *		page 13 - competitionStatisticsTask
 *		page 14 - problemStatisticsTask
 *		page 15 - problemStatementTask
 *		page 16 - memberInterestTask
 *
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/28/2002
 *
 */
public class PageNumTest implements TestConst{

	// if set to true, each link in data table will be shown
	private static boolean showTableDetail;	


	//	from_x_x:	determines path taken. Set them using access methods.
	//	to_x_x:		variables are set inside the page methods to let previous page know which link to use.
	private int from_4_5	= 4,
				from_10_13	= 10;
	private int to_4_5		= 4,
				to_6_7		= 6, 
				to_8_9_10	= 8,
				to_11_12_13 = 11;

	//	Default link to go through from data table is using row 0.
	private int mainTableRow			= 0,
				campaignDetailRow		= 0,
				campaignInterestRow		= 0,
				positionInterestRow		= 0,
				competitionHistoryRow	= 0,
				problemSubmissionRow	= 0,
				competitionStatsRow		= 0;

	private WebConversation wc;


	//===================================================
	// Constructors 
	//===================================================

	public PageNumTest(){
		this(false);
	}

	public PageNumTest(boolean std){
		wc = new WebConversation();
		setShowTableDetail(std);
	}

	//===================================================
	// Static methods 
	//===================================================

	// static init	

	static {
		showTableDetail = false;
	}

	// showTableDetail methods 

	public void setShowTableDetail(boolean s)	{ 
		showTableDetail=s; 
	}

	public boolean getShowTableDetail()	{ 
		return showTableDetail; 
	}

	// Response checking methods

	public static boolean hasError(WebResponse resp)  throws IOException	{ 
		if (resp==null)	{	return true; }
		return (resp.getText().indexOf("Navigation Error")!=-1);
	}

	public static void checkResponse(WebResponse resp) throws IOException	{ 
		if (resp==null)	{	
			TestMessage.addDetailMessage("== Null Response ==", "FF0000"); 
		}else if (resp.getText().indexOf("Navigation Error")!=-1){
			TestMessage.addDetailMessage("== Navigation Error ==", "336600"); 
		}else{
			TestMessage.addDetailMessage("== Page Found ==", "0000CC"); 
		}
	}

	//===================================================
	// Public Instance methods 
	//===================================================

	// Access methods

	public void setFrom_4_5(int x)	{ 
		if (x==4 || x==5)	from_4_5=x; 
	}

	public void setFrom_10_13(int x){ 
		if (x==10 || x==13)	from_10_13=x; 
	}


	// Page methods - each page is process by a method

	// page 1 - loginTask
	public WebResponse loginTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	=  wc.getResponse( new PostMethodWebRequest( LOGIN_URL ) );
			TestMessage.addDetailMessage( "loginTask: " );
			if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
			return resp;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	public WebResponse userLogin() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	=  loginTask();
			if(resp!=null) { 
				WebForm form		= resp.getFormWithName( LOGIN_FORM );
				WebRequest req		= form.getRequest();
				req.setParameter( USER_FIELD, USER_DATA );
				req.setParameter( PASSWORD_FIELD, PASSWORD_DATA );
				resp = wc.getResponse( req );
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 2 - mainTask
	public WebResponse mainTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= userLogin();
			TestMessage.addDetailMessage( "mainTask: " );
			if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
			return resp;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}


	// page 3 - campaignDetailTask
	public WebResponse campaignDetailTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= mainTask();
			TestMessage.addDetailMessage( "campaignDetailTask: " );
			if(resp!=null){
				resp = getLinkOfRowWith(resp, mainTableRow, "task="+PAGE_3_LINK_HREF);
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 4 - campaignInterestTask
	public WebResponse campaignInterestTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= campaignDetailTask();
			TestMessage.addDetailMessage( "campaignInterestTask: " );
			if(resp!=null){
				WebLink viewLink = resp.getLinkWith(VIEW_HIT_LINK_TEXT);
				resp =  (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 5 - positionInterestTask
	public WebResponse positionInterestTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= campaignDetailTask();
			TestMessage.addDetailMessage( "positionInterestTask: " );
			if(resp!=null){
				resp =   getLinkOfRowWith(resp, campaignDetailRow, "task="+PAGE_5_LINK_HREF);
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 6 - overallDemographicInfoTask
	public WebResponse overallDemographicInfoTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp;
			if(from_4_5 == 4)	resp	= campaignInterestTask();
			else				resp	= positionInterestTask();
			TestMessage.addDetailMessage( "overallDemographicInfoTask: " );
			if(resp!=null){
				WebLink viewLink = resp.getLinkWith(VIEW_COL_DEMO_LINK_TEXT);
				resp =  (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 7 - memberProfileTask
	public WebResponse memberProfileTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp;
			if(from_4_5 == 4)	resp	= campaignInterestTask();
			else				resp	= positionInterestTask();
			TestMessage.addDetailMessage( "memberProfileTask: " );
			if(resp!=null){
				resp = getLinkOfRowWith(resp, campaignInterestRow, "task="+PAGE_7_LINK_HREF);
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 8 - individualDemographicInfoTask
	public WebResponse individualDemographicInfoTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= memberProfileTask();
			TestMessage.addDetailMessage( "individualDemographicInfoTask: " );
			if(resp!=null){
				WebLink viewLink = resp.getLinkWith(CODER_DEMO_LINK_TEXT);
				resp = (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 9 - competitionHistoryTask
	public WebResponse competitionHistoryTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= memberProfileTask();
			TestMessage.addDetailMessage( "competitionHistoryTask: " );
			if(resp!=null){
				WebLink viewLink = resp.getLinkWith(CODER_COMP_HIST_LINK_TEXT);
				resp = (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 10 - problemSubmissionTask
	public WebResponse problemSubmissionTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= memberProfileTask();
			TestMessage.addDetailMessage( "problemSubmissionTask: " );
			if(resp!=null){
				WebLink viewLink = resp.getLinkWith(CODER_PROB_SUBM_LINK_TEXT);
				resp = (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 11 - ratingHistoryTask
	public WebResponse ratingHistoryTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= competitionHistoryTask();
			TestMessage.addDetailMessage( "ratingHistoryTask: " );
			if(resp!=null){
				WebLink viewLink = resp.getLinkWith(RATING_HIST_GRAPH_LINK_TEXT);
				resp = (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 12 - overallRatingDistributionGraphTask
	public WebResponse overallRatingDistributionGraphTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= competitionHistoryTask();
			TestMessage.addDetailMessage( "overallRatingDistributionGraphTask: " );
			if(resp!=null){
				WebLink viewLink = resp.getLinkWith(OVERALL_RATING_DIST_GRAPH_LINK_TEXT);
				resp = (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 13 - competitionStatisticsTask
	public WebResponse competitionStatisticsTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= competitionHistoryTask();
			TestMessage.addDetailMessage( "competitionStatisticsTask: " );
			if(resp!=null){
				resp = getLinkOfRowWith(resp, 0, "task="+PAGE_13_LINK_HREF);
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 14 - problemStatisticsTask
	public WebResponse problemStatisticsTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp;
			if(from_10_13 == 10)	resp	= problemSubmissionTask();
			else					resp	= competitionStatisticsTask();
			TestMessage.addDetailMessage( "problemStatisticsTask: " );
			if(resp!=null){
				resp	= getLinkOfRowWith(resp, 0, "task="+PAGE_14_LINK_HREF);
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;	
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 15 - problemStatementTask
	public WebResponse problemStatementTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= problemStatisticsTask();
			TestMessage.addDetailMessage( "problemStatementTask: " );
			if(resp!=null){
				WebLink viewLink = resp.getLinkWith(PROB_STMT_LINK_TEXT);
				resp = (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}

	// page 16 - memberInterestTask
	public WebResponse memberInterestTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= memberProfileTask();
			TestMessage.addDetailMessage( "memberInterestTask: " );
			if(resp!=null){
				WebLink viewLink = resp.getLinkWith(MEMBER_INTEREST_LINK_TEXT);
				resp = (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	
				if(resp!=null) { TestMessage.addDetailMessage( " - " + resp.getURL() ); }
				return resp;
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			return null;
		}		 
	}
	
	//===================================================
	// Private methods 
	//===================================================

	private WebResponse getLinkOfRowWith(WebResponse resp, int row, String matchStr)
			throws IOException, org.xml.sax.SAXException{
		try{
			WebLink[] link		= resp.getLinks();
			int index=-1;
			for (int i=0,j=0; i<link.length; i++){
				if (link[i].getURLString().indexOf( matchStr )!=-1){
					if(showTableDetail) {
						TestMessage.addDetailMessage("Row "+j+":  "+link[i].asText()+" - "+link[i].getURLString());
					}
					if(row == j++)	{
						index = i;
						if (!showTableDetail) break;
					}
				}
			}
			return (index!=-1)?wc.getResponse( link[index].getRequest() ):null;
		}catch(com.meterware.httpunit.HttpInternalErrorException se){return null;}		 
	}

}// end class PageNumTest


