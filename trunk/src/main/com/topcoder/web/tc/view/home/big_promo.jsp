<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>

<br />

<%
    StringBuffer sb = new StringBuffer();
    URL url = null;
    InputStream is = null;
    BufferedReader br = null;
    String content = "";
    try{
        url = new URL("http://topcoder.com/home/blog/category/hidden/feed/");
		String line = null;
		is = url.openStream();
		InputStreamReader read = new InputStreamReader(is, "UTF-8");
		br = new BufferedReader(read);
		while ((line = br.readLine()) != null) {
		    sb.append(line + "\n");                
		}
		int found = sb.indexOf("http://topcoder.com/home/?p=3932");
		int start = sb.indexOf( "<p>", found);
        int end = sb.indexOf("</p>", start);
		content = sb.substring(start + 3, end);
	} catch (Exception e) {
	} finally{
		try{
		    if (br != null)
		        br.close();
		} catch(IOException e){
		}
	}
	out.println(content);
%>

<br /><br />
