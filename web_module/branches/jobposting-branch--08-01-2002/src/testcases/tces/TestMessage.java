
import com.meterware.httpunit.*;
import org.xml.sax.SAXException;
import java.io.*;
import java.net.URL;

/**
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/27/2002
 *
 */
public class TestMessage{

	private static StringBuffer sb;			// store message instead of printing directly to System.out
	private static StringBuffer title;		// store message instead of printing directly to System.out
	private static int titleId;

	static {
		clearMessage();
	}


	// Message methods 

	public static void clearMessage() { 
		sb = new StringBuffer();
		title = new StringBuffer();
		titleId = 0;
	}

	public static String getMessage() { 
		return title.toString()+"<br><br><br>"+sb.toString(); 
	}

	public static void addDetailMessage(String str) { 
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		sb.append("<br>"+str); 
	}

	public static void addDetailMessage(java.net.URL url) { 
		addDetailMessage(url.toString()); 
	}

	public static void addTitleMessage(String str) { 
		title.append("<br><br><a href=\"#title"+(++titleId)+"\"><b>"+str+"</b></a>");
		sb.append("<br><br><br><hr size=5><a name=\"title" + titleId + "\"><b>" + 
				str + "</b></a><hr size=5>"); 
	}
	public static void addSubTitleMessage(String str) { 
		title.append("<br><a href=\"#title"+(++titleId)+"\">"+str+"</a>");
		sb.append("<br><br><br><a name=\"title" + titleId + "\"><b>" + str + "</b></a><hr size=1>"); 
	}
	public static void addError(String str) { 
		sb.append("<br><font color=FF0000>" + str + "</font>");
	}

	// Response checking methods

	public static boolean hasError(WebResponse resp)  throws IOException	{ 
		if (resp==null)	{	return true; }
		return (resp.getText().indexOf("Navigation Error")!=-1);
	}

	public static void checkResponse(WebResponse resp) throws IOException	{ 
		checkResponse(resp, null);
	}

	public static void checkResponse(WebResponse resp, String match) throws IOException	{ 
		if (resp==null)	{	
			sb.append("<br><font color=FF0000>NULL</font>"); 
		}else if (resp.getText().indexOf("Navigation Error")!=-1){
			sb.append("<br><font color=FF0000>Navigation Error</font>");
		}else if (match!=null){
			if(resp.getText().indexOf(match)==-1){
				sb.append("<br><font color=FF0000>Invalid Page</font>");
			}else{
				sb.append("<br><font color=000099>Valid Page</font>");
			}
		}else{
			sb.append("<br><font color=009900>No Match</font>");
		}
	}



}// end class PageNumTest


