//package com.topcoder.web.tces.test;

import com.meterware.httpunit.*;
import org.xml.sax.SAXException;
import java.io.*;


/**
 * Tests flow of site. Each method represent a different page and will call all 
 * methods for pages before it to check all links leading to the page. Since 
 * there could be more than one path to a page, the actual path can be determine 
 * by setting the "FLOW PATH variables".
 * TODO: Testing will be handle in another class and "FLOW PATH variables" will 
 * be set from a xml file of all possible paths(excluding dif row #).
 *
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/20/2002
 *
 */
public class FlowTest implements TestConst{

	/* FLOW PATH variables
	 *	Change boolean to click on a link on top such as [View Hit Details]. 
	 *	Change int value for row number starting 0 in the main table of data.
	 *	Next page depends on order of variables - same order as they are check 
	 *	in the methods. (i.e. In CampaignDetailTask: a campaign row will not 
	 *	be clicked unless campaignDetailViewHit=false.)
	 */
	// MainTask
	private int		mainTableRow				= 0;
	
	// CampaignDetailTask
	private boolean campaignDetailViewHit		= false;
	private int		campaignDetailRow			= 0;

	// CampaignInterestTask
	private boolean campaignInterestViewColDemo	= false;
	private int		campaignInterestRow			= 0;

	// PositionInterestTask
	private boolean positionInterestViewColDemo	= false;
	private int		positionInterestRow			= 0;

	// OverallDemographicInfoTask
	private boolean overallDemographicInfoFromCampaign = false; // previous from CampaignInterestTask, else PositionInterestTask

	// MemberProfileTask
	private boolean memberProfileFromCampaign	= false; 		// previous from CampaignInterestTask, else PositionInterestTask
	// At least one of the following three has to be true. The first true one will determine next page.
	private boolean memberProfileCoderDemo		= true;
	private boolean memberProfileCoderCompHist	= false;
	private boolean memberProfileCoderProbSubm	= false;




	// class variables	
	private WebConversation wc;



	// main method	

	public static void main(String args[]){
		try{
			(new FlowTest()).memberProfileTask();	// change for dif test
		}catch(java.io.IOException ioe){
			System.out.println("IOException");
		}catch(org.xml.sax.SAXException se){
			System.out.println("SAXException");
		}
	}


	// constructor	

	public FlowTest(){
		wc = new WebConversation();
	}



	// public methods

	public WebResponse loginPage() throws IOException, org.xml.sax.SAXException{
		return wc.getResponse( new PostMethodWebRequest( LOGIN_URL ) );
	}

	public WebResponse loginTask() throws IOException, org.xml.sax.SAXException{
		WebResponse resp	= loginPage();
		System.out.println( "\nloginTask: \t" );
		if(resp!=null){
			System.out.println( resp.getURL() );
			WebForm form		= resp.getFormWithName( LOGIN_FORM );
			WebRequest req		= form.getRequest();
			req.setParameter( USER_FIELD, USER_DATA );
			req.setParameter( PASSWORD_FIELD, PASSWORD_DATA );
			return wc.getResponse( req );
		}
		return null;
	}

	public WebResponse mainTask() throws IOException, org.xml.sax.SAXException{
		WebResponse resp	= loginTask();
		System.out.println( "\nmainTask: \t" );
		if(resp!=null){
			System.out.println( resp.getURL() );
			WebLink[] link		= resp.getLinks();
			for (int i=0,j=0; i<link.length; i++){
				if (link[i].getURLString().indexOf("task=CampaignDetailTask")!=-1){
					System.out.println("Row "+j+":  "+link[i].asText()+" - "+link[i].getURLString());
					if(mainTableRow==j++)	return wc.getResponse( link[i].getRequest() );
				}
			}
		}
		return null;
	}

	public WebResponse campaignDetailTask() throws IOException, org.xml.sax.SAXException{
		WebResponse resp	= mainTask();
		System.out.println( "\ncampaignDetailTask: \t" );
		if(resp!=null){
			System.out.println( resp.getURL() );
			if(campaignDetailViewHit){
				WebLink viewLink = resp.getLinkWith(VIEW_HIT_LINK_TEXT);
				return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
			}else{
				WebLink[] link		= resp.getLinks();
				for (int i=0,j=0; i<link.length; i++){
					if (link[i].getURLString().indexOf("task=PositionInterestTask")!=-1){
						System.out.println("Row "+j+":  "+link[i].asText()+" - "+link[i].getURLString());
						if(campaignDetailRow==j++)	return wc.getResponse( link[i].getRequest() );
					}
				}
			}
		}
		return null;
	}

	public WebResponse campaignInterestTask() throws IOException, org.xml.sax.SAXException{
		WebResponse resp	= campaignDetailTask();
		System.out.println( "\ncampaignInterestTask: \t" );
		if(resp!=null){
			System.out.println( resp.getURL() );
			if(campaignInterestViewColDemo){
				WebLink viewLink = resp.getLinkWith(VIEW_COL_DEMO_LINK_TEXT);
				return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
			}else{
				WebLink[] link		= resp.getLinks();
				for (int i=0,j=0; i<link.length; i++){
					if (link[i].getURLString().indexOf("task=MemberProfileTask")!=-1){
						System.out.println("Row "+j+":  "+link[i].asText()+" - "+link[i].getURLString());
						if(campaignInterestRow==j++)	return wc.getResponse( link[i].getRequest() );
					}
				}
			}
		}
		return null;
	}

	public WebResponse positionInterestTask() throws IOException, org.xml.sax.SAXException{
		WebResponse resp	= campaignDetailTask();
		System.out.println( "\npositionInterestTask: \t" );
		if(resp!=null){
			System.out.println( resp.getURL() );
			if(positionInterestViewColDemo){
				WebLink viewLink = resp.getLinkWith(VIEW_COL_DEMO_LINK_TEXT);
				return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
			}else{
				WebLink[] link		= resp.getLinks();
				for (int i=0,j=0; i<link.length; i++){
					if (link[i].getURLString().indexOf("task=MemberProfileTask")!=-1){
						System.out.println("Row "+j+":  "+link[i].asText()+" - "+link[i].getURLString());
						if(positionInterestRow==j++)	return wc.getResponse( link[i].getRequest() );
					}
				}
			}
		}
		return null;
	}

	public WebResponse overallDemographicInfoTask() throws IOException, org.xml.sax.SAXException{
		WebResponse resp;
		if(overallDemographicInfoFromCampaign)	
			resp	= campaignInterestTask();
		else	
			resp	= positionInterestTask();
		System.out.println( "\noverallDemographicInfoTask: \t" );
		if(resp!=null){
			System.out.println( resp.getURL() );
		}
		return resp;
	}

	public WebResponse memberProfileTask() throws IOException, org.xml.sax.SAXException{
		WebResponse resp;
		if(memberProfileFromCampaign)	
			resp	= campaignInterestTask();
		else	
			resp	= positionInterestTask();
		System.out.println( "\nmemberProfileTask: \t" );
		if(resp!=null){
			System.out.println( resp.getURL() );
			WebLink viewLink=null;
			if (memberProfileCoderDemo){
				viewLink = resp.getLinkWith(CODER_DEMO_LINK_TEXT);
			}else if (memberProfileCoderCompHist){
				viewLink = resp.getLinkWith(CODER_COMP_HIST_LINK_TEXT);
			}else if (memberProfileCoderProbSubm){
				viewLink = resp.getLinkWith(CODER_PROB_SUBM_LINK_TEXT);
			}
			return (viewLink==null)?null:wc.getResponse( viewLink.getRequest() );	// goto  CampaignInterest
		}
		return null;
	}

	// TODO: Need pages after memberProfileTask

}// end class FlowTest


