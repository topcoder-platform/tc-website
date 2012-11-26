<%--                   
/**
 *  index.jsp
 */
--%>
<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.shared.dataAccess.resultSet.*"
%>

<%!
String htmlEncode(String s){
  StringBuffer sb = new StringBuffer();
  char ch = ' ';
  for(int i=0; i<s.length(); i++){
    if ((ch=s.charAt(i))=='>'){
      sb.append("&gt;");
    }else if (ch==9){  //we'll go with 2 spaces for a tab
     sb.append("  ");
    }else if (ch=='<'){
      sb.append("&lt;");
    }else if (ch==10 || ch==13){
      sb.append("<BR/>");
    }else if (ch==' '){
      sb.append("&#160;");
    }else if (((int)ch)<32){
    //anything less than a "space" character is technically unprintable
      sb.append("[\\u"+(int)ch+"]");
    } else if ((((int)ch)>126)&&(((int)ch)<160)){
    //anything in this range is unprintable per latin-1
      sb.append("[\\u"+(int)ch+"]");
    } else if ((((int)ch)>=160)&&(((int)ch)<=255)){
    //anything in this range is printable per latin-1 with a little massaging
      sb.append("&#"+(int)ch+";");
    } else if ((int)ch>255){
      //anything in this range is unprintable per latin-1
      //html4.0 has some support but it isn't worth picking out a few cases that
      //some browsers won't display properly.
      sb.append("[\\u"+(int)ch+"]");
    } else sb.append(ch);
  }
  return sb.toString();
}
%>
<%  
  Map resultMap = (Map)request.getAttribute("DATA_DUMP");
  ResultSetContainer rsc = null;
  Iterator it = null;
  Map.Entry entry = null;
  String key = null;
  String displayType = request.getParameter("display")==null?"":request.getParameter("display");
%>

<html>
  <head>
    <title>Data Dump</title>
  </head>
  <body>
<%
      it = resultMap.entrySet().iterator();
      while (it.hasNext()) {
        entry = (Map.Entry) it.next();
        key = entry.getKey().toString();
        rsc = (ResultSetContainer)resultMap.get(key);
        if (displayType.equals("xml")) {
%>
          <%=htmlEncode(rsc.getTag(key,"ResultRow").getXML(2))%>
<%      } else if (displayType.equals("")) {
%>
        <%=htmlEncode(rsc.toString("\n", ","))%>
<%      }
%>
<BR/>
<BR/>
<hr/>
<BR/>
<BR/>
<%


      }
%>

  </body> 
</html>

