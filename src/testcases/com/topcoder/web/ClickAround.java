package com.topcoder.web;

import junit.framework.TestCase;
import com.meterware.httpunit.*;

import java.util.*;
import java.io.EOFException;

/**
 * @author dok
 * Date: Mar 19, 2004
 */
public class ClickAround {

    public static void main(String[] args) {
        ClickAround c = new ClickAround();
        c.homepage();
    }

    public void homepage() {
        try {
            WebConversation wc = new WebConversation();
            HashSet all = new HashSet();
            HashSet root = new HashSet();
            root.add("http://www.topcoder.com");
            build(wc, root, all, 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void build(WebConversation wc, Set parents, Set all, int depth) throws Exception {
        String link = null;
        for (Iterator it = parents.iterator(); it.hasNext();) {
            link = (String) it.next();
            //don't follow javascript links and mailto's etc.
            if (link.toLowerCase().startsWith("http://www.topcoder.com")) {
                if (all.add(link)) {
                    System.out.println("depth " + depth + " pages " + all.size()+ " " + link);
                    build(wc, getChildren(wc, link), all, depth + 1);
                }
            }
        }
    }

    private Set getChildren(WebConversation wc, String request) throws Exception {
        WebResponse wr = null;
        HashSet s = new HashSet();
        try {
            wr = wc.getResponse(request);
            if (wr.getContentType().equals("text/html")) {
                WebLink[] linkArray = wr.getLinks();
                for (int i = 0; i < linkArray.length; i++) {
                    s.add(linkArray[i].getRequest().getURL().toString());
                }
            }
        } catch (EOFException e) {
            //skip this, it's probably a gzip'd xsl sheet, and there is a java bug on this right now
            //to fix, you probably gotta change the implementation
        } catch (ScriptException e) {
            //skip this too
        }
        return s;
    }



    /*	public WebResponse loginTask() throws IOException, org.xml.sax.SAXException{
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
	}*/

}
