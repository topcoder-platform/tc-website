//package com.topcoder.web.tces.test;

import com.meterware.httpunit.*;
import org.xml.sax.SAXException;
import java.io.*;

// TODO: add 'ID="dataTable"' to tables in jsp

/**
 * Tests data on the site. Each method will test the correctness of data on a
 * different page. Data tables need to be reset each time for consistent results.
 * 
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/20/2002
 *
 */
public class DataTest implements TestConst{


	// class variables	
	private WebConversation wc;



	// main method	

	public static void main(String args[]){
		try{
			DataTest dataTest = new DataTest();
			if(dataTest.resetData()){
				if (dataTest.login()) {
					dataTest.mainTask();	// change for dif test
				}else{
					System.out.println("Login Failed.");
				}
			}else{
				System.out.println("Reset Data Failed.");
			}
		}catch(java.io.IOException ioe){
			System.out.println("IOException");
		}catch(org.xml.sax.SAXException se){
			System.out.println("SAXException");
		}
	}


	// constructor	

	public DataTest(){
		wc = new WebConversation();
	}



	// private methods

	private boolean login() throws IOException, org.xml.sax.SAXException{
		WebResponse resp	= wc.getResponse( new PostMethodWebRequest( LOGIN_URL ) );
		if(resp!=null){
			System.out.println( resp.getURL() );
			WebForm form		= resp.getFormWithName( LOGIN_FORM );
			WebRequest req		= form.getRequest();
			req.setParameter( USER_FIELD, USER_DATA );
			req.setParameter( PASSWORD_FIELD, PASSWORD_DATA );
			return (wc.getResponse( req )!=null)?true:false;	// change to check not error page
		}
		return false;
	}

	private boolean resetData(){
		//TODO: resetData
		return true;
	}


	// public methods

	public void mainTask() throws IOException, org.xml.sax.SAXException{
		WebResponse resp	= wc.getResponse( new PostMethodWebRequest( MAIN_URL ) );
		System.out.println( "\nmainTask: \t" );
		if(resp!=null){
			System.out.println( resp.getURL() );
			WebTable table		= resp.getTableWithID( TABLE_ID );
			for (int i=0; i<table.getRowCount(); i++){
				for (int j=0; j<table.getColumnCount(); j++){
					TableCell tc = table.getTableCell(i,j);
					System.out.println("("+i+", "+j+"):  "+tc.asText());
					//TODO: compare with expected data
				}
			}
		}
	}


}// end class FlowTest


