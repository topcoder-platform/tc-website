import java.io.*;
import java.net.URL;

/**
 * Store message. 
 * 
 * @author Lai Kwan Wong <laikwanwong@hotmail.com> 
 * @version 1.0 - 8/27/2002
 *
 */
public class TestMessage{

	private static StringBuffer sb;			// store message instead of printing directly to System.out
	private static StringBuffer title;		// store message instead of printing directly to System.out
	private static int titleId;
	private static boolean showDetail;
	private static boolean htmlDoc;
	private static String nextLine;
	private static String bold;
	private static String _bold;
	private static String line1;
	private static String line5;

	static {
		clearMessage();
	}


	// get and set methods

	public static void clearMessage() { 
		clearMessage(true, true);
	}

	public static void clearMessage(boolean showDetail, boolean htmlDoc) { 
		sb = new StringBuffer();
		title = new StringBuffer();
		titleId = 0;
		setShowDetail(showDetail);
		setHtmlDoc(htmlDoc);
	}

	public static void setShowDetail(boolean b) { showDetail=b;	}
	public static boolean getShowDetail() { return showDetail;	}

	public static void setHtmlDoc(boolean b) { 
		htmlDoc=b;	
		nextLine = htmlDoc?"<br>":"\n";
		line1 = htmlDoc?"<hr size=1>":"------------------------------------------------------";
		line5 = htmlDoc?"<hr size=5>":"======================================================";
		bold = htmlDoc?"<b>":"";
		_bold = htmlDoc?"</b>":"";
	}
	public static boolean getHtmlDoc() { return htmlDoc;	}

	public static String getTitle() { 
		return title.toString(); 
	}
	public static String getMessage() { 
		return sb.toString(); 
	}

	// add methods

	public static void addDetailMessage(String str, String color) { 
		if(showDetail) {
			sb.append(nextLine + (htmlDoc?"<font color="+color+">":"") + 
					str + (htmlDoc?"</font>":""));
		}
	}

	public static void addDetailMessage(String str) { 
		addDetailMessage(str, "000000"); 
	}

	public static void addDetailMessage(java.net.URL url) { 
		addDetailMessage(url.toString()); 
	}

	public static void addTitleMessage(String str) { 
		if(htmlDoc)title.append(nextLine+nextLine+ bold + 
				"<a href=\"#title"+(++titleId)+"\">"+str+"</a>"+ _bold);
		sb.append(nextLine+nextLine+nextLine + line5 + bold +
				(htmlDoc?("<a name=\"title" + titleId + "\">"):"") + 
				str + (htmlDoc?("</a>"):"") + _bold + line5); 
	}

	public static void addSubTitleMessage(String str) { 
		if(htmlDoc)title.append(nextLine+"<a href=\"#title"+(++titleId)+"\">"+str+"</a>");
		sb.append(nextLine+nextLine+nextLine + bold +
				(htmlDoc?("<a name=\"title" + titleId + "\">"):"") + 
				str + (htmlDoc?("</a>"):"") + _bold + line1); 
	}
	public static void addError(String str) { 
		sb.append(nextLine + (htmlDoc?"<font color=FF0000>":"ERR: ") + str + (htmlDoc?"</font>":""));
	}

}// end class TestMessage


