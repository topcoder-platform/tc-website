
import com.meterware.httpunit.*;
import com.meterware.httpunit.HttpInternalErrorException;
import org.xml.sax.SAXException;
import java.io.*;


/**
 * Tests flow of site. Each method represent a different page and will call all 
 * methods for pages before it to check all links leading to the page. Since 
 * there could be more than one path to a page, the actual path can be determine 
 * by setting the "FLOW PATH variables". When getting link from data table, 
 * always use link in first row.
 *
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/27/2002
 *
 */
public class PageNumTest implements TestConst{

	private static boolean showTableDetail;	// if set to true, each link in data table will be shown


	// FLOW PATH variables

	//	Path taken depends on from_x_x variables. Set them using access methods.
	//	The to_x_x variables are set inside the methods to let previous page know which link to use.
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

	// page 0
	public WebResponse loginPage() throws IOException, org.xml.sax.SAXException{
		try{
			return wc.getResponse( new PostMethodWebRequest( LOGIN_URL ) );
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 1 - loginTask
	public WebResponse loginTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= loginPage();
			TestMessage.addDetailMessage( "<b>loginTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				WebForm form		= resp.getFormWithName( LOGIN_FORM );
				WebRequest req		= form.getRequest();
				req.setParameter( USER_FIELD, USER_DATA );
				req.setParameter( PASSWORD_FIELD, PASSWORD_DATA );
				return wc.getResponse( req );
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 2 - mainTask
	public WebResponse mainTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= loginTask();
			TestMessage.addDetailMessage( "<b>mainTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				return getLinkOfRowWith(resp, mainTableRow, "task="+PAGE_2_TABLE_LINK_HREF);
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}


	// page 3 - campaignDetailTask
	public WebResponse campaignDetailTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= mainTask();
			TestMessage.addDetailMessage( "<b>campaignDetailTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				if(to_4_5 == 4){
					WebLink viewLink = resp.getLinkWith(VIEW_HIT_LINK_TEXT);
					return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
				}else{
					return getLinkOfRowWith(resp, campaignDetailRow, "task="+PAGE_3_TABLE_LINK_HREF);
				}
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 4 - campaignInterestTask
	public WebResponse campaignInterestTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_4_5 = 4;
			WebResponse resp	= campaignDetailTask();
			TestMessage.addDetailMessage( "<b>campaignInterestTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				if(to_6_7 == 6){
					WebLink viewLink = resp.getLinkWith(VIEW_COL_DEMO_LINK_TEXT);
					return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
				}else{
					return getLinkOfRowWith(resp, campaignInterestRow, "task="+PAGE_4_TABLE_LINK_HREF);
				}
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 5 - positionInterestTask
	public WebResponse positionInterestTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_4_5 = 5;
			WebResponse resp	= campaignDetailTask();
			TestMessage.addDetailMessage( "<b>positionInterestTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				if(to_6_7 == 7){
					WebLink viewLink = resp.getLinkWith(VIEW_COL_DEMO_LINK_TEXT);
					return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
				}else{
					return getLinkOfRowWith(resp, positionInterestRow, "task="+PAGE_5_TABLE_LINK_HREF);
				}
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 6 - overallDemographicInfoTask
	public WebResponse overallDemographicInfoTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_6_7 = 6;
			WebResponse resp;
			if(from_4_5 == 4)	
				resp	= campaignInterestTask();
			else	
				resp	= positionInterestTask();
			TestMessage.addDetailMessage( "<b>overallDemographicInfoTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
			}
			return resp;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 7 - memberProfileTask
	public WebResponse memberProfileTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_6_7 = 7;
			WebResponse resp;
			if(from_4_5 == 4)	
				resp	= campaignInterestTask();
			else	
				resp	= positionInterestTask();
			TestMessage.addDetailMessage( "<b>memberProfileTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				WebLink viewLink=null;
				if (to_8_9_10 == 8){
					viewLink = resp.getLinkWith(CODER_DEMO_LINK_TEXT);
				}else if (to_8_9_10 == 9){
					viewLink = resp.getLinkWith(CODER_COMP_HIST_LINK_TEXT);
				}else if (to_8_9_10 == 10){
					viewLink = resp.getLinkWith(CODER_PROB_SUBM_LINK_TEXT);
				}
				return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 8 - individualDemographicInfoTask
	public WebResponse individualDemographicInfoTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_8_9_10 = 8;
			WebResponse resp	= memberProfileTask();
			TestMessage.addDetailMessage( "<b>individualDemographicInfoTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
			}
			return resp;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 9 - competitionHistoryTask
	public WebResponse competitionHistoryTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_8_9_10 = 9;
			WebResponse resp	= memberProfileTask();
			TestMessage.addDetailMessage( "<b>competitionHistoryTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				WebLink viewLink=null;
				if (to_11_12_13 == 11){
					viewLink = resp.getLinkWith(RATING_HIST_GRAPH_LINK_TEXT);
				}else if (to_11_12_13 == 12){
					viewLink = resp.getLinkWith(OVERALL_RATING_DIST_GRAPH_LINK_TEXT);
				}else{
					return getLinkOfRowWith(resp, competitionHistoryRow, "task="+PAGE_9_TABLE_LINK_HREF);
				}
				return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 10 - problemSubmissionTask
	public WebResponse problemSubmissionTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_8_9_10 = 10;
			WebResponse resp	= memberProfileTask();
			TestMessage.addDetailMessage( "<b>problemSubmissionTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				return getLinkOfRowWith(resp, problemSubmissionRow, "task="+PAGE_10_TABLE_LINK_HREF);
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 11 - ratingHistoryTask
	public WebResponse ratingHistoryTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_11_12_13 = 11;
			WebResponse resp	= competitionHistoryTask();
			TestMessage.addDetailMessage( "<b>ratingHistoryTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
			}
			return resp;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 12 - overallRatingDistributionGraphTask
	public WebResponse overallRatingDistributionGraphTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_11_12_13 = 12;
			WebResponse resp	= competitionHistoryTask();
			TestMessage.addDetailMessage( "<b>overallRatingDistributionGraphTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
			}
			return resp;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 13 - competitionStatisticsTask
	public WebResponse competitionStatisticsTask() throws IOException, org.xml.sax.SAXException{
		try{
			to_11_12_13 = 13;
			WebResponse resp	= competitionHistoryTask();
			TestMessage.addDetailMessage( "<b>competitionStatisticsTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				return getLinkOfRowWith(resp, competitionStatsRow, "task="+PAGE_13_TABLE_LINK_HREF);
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 14 - problemStatisticsTask
	public WebResponse problemStatisticsTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp;
			if(from_10_13 == 10)	
				resp	= problemSubmissionTask();
			else	
				resp	= competitionStatisticsTask();
			TestMessage.addDetailMessage( "<b>problemStatisticsTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
				WebLink viewLink = resp.getLinkWith(PROB_STMT_LINK_TEXT);
				return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	
			}
			return null;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
			return null;
		}		 
	}

	// page 15 - problemStatementTask
	public WebResponse problemStatementTask() throws IOException, org.xml.sax.SAXException{
		try{
			WebResponse resp	= problemStatisticsTask();
			TestMessage.addDetailMessage( "<b>problemStatementTask: </b>" );
			if(resp!=null){
				TestMessage.addDetailMessage( resp.getURL() );
			}
			return resp;
		}catch(com.meterware.httpunit.HttpInternalErrorException hiee){
			TestMessage.addError(hiee.getMessage());
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


