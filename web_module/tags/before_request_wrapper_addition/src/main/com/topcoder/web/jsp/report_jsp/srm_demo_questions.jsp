<%@  page
  language="java"
  import="
		  java.io.*,
java.util.*,
java.sql.*,
java.text.*,
java.text.DateFormat,
com.topcoder.shared.util.DBMS,
javax.servlet.jsp.JspWriter,
		  java.lang.Object,
		            com.topcoder.common.web.data.report.Constants,
          com.topcoder.shared.dataAccess.DataAccessConstants,
          com.topcoder.common.web.data.report.Query,
		  com.topcoder.shared.dataAccess.*,
		  com.topcoder.shared.dataAccess.resultSet.*,
		  com.topcoder.shared.util.TCContext,
		  java.text.NumberFormat,
		  java.math.BigInteger,
		  java.lang.Object

"
%>
<%
String newrd;
if (request.getParameter("rd")==null)
{
	newrd="4445";
}
else
{
	newrd = request.getParameter("rd");
}
%>
<%!
  //////////////////////////////////////////////////////////////////////////////// 
  public static void doit(JspWriter out, int coderType, int roundID) throws SQLException, Exception
  //////////////////////////////////////////////////////////////////////////////// 
  {
    //if (args.length < 2)
    //{
    //  out.println("");
    //  out.println("Usage: java mail_progs.massEmail subject filename");
    //  out.println("");
    //  return;
    //}

    int coderCount = 0;
    int overallTotal = 0;
 
    StringBuffer sqlStr1 = new StringBuffer(228);
    sqlStr1.append("select ");
    sqlStr1.append("  dq.demographic_question_id, ");
    sqlStr1.append("  dq.demographic_question_text ");
    sqlStr1.append("from ");
    sqlStr1.append("  demographic_assignment da, ");
    sqlStr1.append("  demographic_question dq ");
    sqlStr1.append("where ");
    sqlStr1.append("  da.coder_type_id = ? and ");
    sqlStr1.append("  da.status = 'A' and ");
    //sqlStr1.append("  dq.demographic_question_id = 10 and ");
    sqlStr1.append("  da.demographic_question_id = dq.demographic_question_id ");
    sqlStr1.append("order by ");
    sqlStr1.append("  dq.demographic_question_id ");


    StringBuffer sqlStr2 = new StringBuffer(228);
    sqlStr2.append("select ");
    sqlStr2.append("  demographic_answer_text, sort, ");
    sqlStr2.append("  count(*) as cnt ");
    sqlStr2.append("from ");
    sqlStr2.append("  coder c, ");
    sqlStr2.append("  user u ");
    sqlStr2.append("  ,rating cr ");
    sqlStr2.append("  ,demographic_response dr, ");
    sqlStr2.append("  demographic_answer da ");
    sqlStr2.append("where ");
    sqlStr2.append("  c.coder_type_id = ? and ");

    if (roundID > 0)
    {
      sqlStr2.append("  c.coder_id in (select coder_id from room_result rr, room r where rr.round_id = " + roundID + " and r.round_id = rr.round_id and r.room_id = rr.room_id and r.room_type_id = 2 ) and ");
    }
    //sqlStr2.append("c.coder_id in (select coder_id from room_result where round_id in (4324,4325) and attended = 'Y' and old_rating is not null) and ");


    sqlStr2.append("  dr.demographic_question_id = ? and ");
    sqlStr2.append("  c.coder_id = dr.coder_id and ");
    sqlStr2.append("  c.coder_id = cr.coder_id and ");
    sqlStr2.append("  u.user_id = c.coder_id and ");
    sqlStr2.append("  u.status = 'A' and u.email not like '%topcoder.com%' and ");
    sqlStr2.append("  dr.demographic_answer_id = da.demographic_answer_id ");

    sqlStr2.append("  and c.coder_id not in (133670,107165) ");

    sqlStr2.append("group by ");
    sqlStr2.append("  demographic_answer_text, sort ");
    sqlStr2.append("order by ");
    sqlStr2.append("  sort ");

    StringBuffer sqlStr3 = new StringBuffer(228);
    sqlStr3.append("select ");
    sqlStr3.append("  referral_desc, count(*) ");
    sqlStr3.append("from ");
    sqlStr3.append("  user u ");
    sqlStr3.append("  ,coder c, ");
    sqlStr3.append("  rating cr, ");
    sqlStr3.append("  referral rt, ");
    sqlStr3.append("  coder_referral cor ");
    sqlStr3.append("where ");
    sqlStr3.append("  status = 'A' and ");

    if (roundID > 0)
    {
      sqlStr3.append("  c.coder_id in (select coder_id from room_result rr, room r where rr.round_id = " + roundID + " and r.round_id = rr.round_id and r.room_id = rr.room_id and r.room_type_id = 2 ) and ");
    }
    //sqlStr3.append("c.coder_id in (select coder_id from room_result where round_id in (4324,4325) and attended = 'Y' and old_rating is not null) and ");

    sqlStr3.append("  email not like '%topcoder.com%' and ");
    sqlStr3.append("  u.user_id = c.coder_id and ");
    sqlStr3.append("  c.coder_id = cr.coder_id and ");
    sqlStr3.append("  c.coder_type_id = ? and ");
    sqlStr3.append("  c.coder_id = cor.coder_id and ");
    sqlStr3.append("  cor.referral_id = rt.referral_id ");

    sqlStr3.append("  and c.coder_id not in (133670,107165) ");

    sqlStr3.append("group by referral_desc ");

    StringBuffer sqlStr5 = new StringBuffer(228);
    sqlStr5.append("select ");
    sqlStr5.append("  count(*) ");
    sqlStr5.append("from ");
    sqlStr5.append("  user u ");
    sqlStr5.append("  ,coder c, ");
    sqlStr5.append("  rating cr, ");
    sqlStr5.append("  coder_notify cn ");
    sqlStr5.append("where ");
    sqlStr5.append("  status = 'A' and ");

    if (roundID > 0)
    {
      sqlStr5.append("  c.coder_id in (select coder_id from room_result rr, room r where rr.round_id = " + roundID + " and r.round_id = rr.round_id and r.room_id = rr.room_id and r.room_type_id = 2 ) and ");
    }
    //sqlStr5.append("c.coder_id in (select coder_id from room_result where round_id in (4324,4325) and attended = 'Y' and old_rating is not null) and ");


    sqlStr5.append("  email not like '%topcoder.com%' and ");
    sqlStr5.append("  u.user_id = c.coder_id and ");
    sqlStr5.append("  c.coder_id = cr.coder_id and ");
    sqlStr5.append("  c.coder_id = cn.coder_id and ");
    sqlStr5.append("  cn.notify_id = 1 and ");
    sqlStr5.append("  c.coder_type_id = ? ");

    sqlStr5.append("  and c.coder_id not in (133670,107165) ");


    StringBuffer sqlStr4 = new StringBuffer(228);
    sqlStr4.append("select count(*) from coder c, rating cr, user u where c.coder_id = cr.coder_id and u.user_id = c.coder_id and coder_type_id = ? and u.status = 'A' and email not like '%topcoder.com%'");


    if (roundID > 0)
    {
      sqlStr4.append("  and c.coder_id in (select coder_id from room_result rr, room r where rr.round_id = " + roundID + " and r.round_id = rr.round_id and r.room_id = rr.room_id and r.room_type_id = 2 ) ");
    }
    //sqlStr4.append(" and c.coder_id in (select coder_id from room_result where round_id in (4324,4325) and attended = 'Y' and old_rating is not null)  ");

    sqlStr4.append("  and c.coder_id not in (133670,107165) ");

    Connection conn = DBMS.getConnection();
    PreparedStatement ps = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;
    PreparedStatement ps4 = null;
    PreparedStatement ps5 = null;
    ResultSet rs = null;
    ResultSet rs2 = null;
    ResultSet rs3 = null;
    ResultSet rs4 = null;
    ResultSet rs5 = null;
    int quesId = 0;
    String quesText = "";

    ps = conn.prepareStatement(sqlStr1.toString());
    ps2 = conn.prepareStatement(sqlStr2.toString());
    ps3 = conn.prepareStatement(sqlStr3.toString());
    ps5 = conn.prepareStatement(sqlStr5.toString());
    ps4 = conn.prepareStatement(sqlStr4.toString());
    ps.setInt(1, coderType);
    ps.executeQuery();
    rs = ps.getResultSet();
    ps3.setInt(1, coderType);
    ps3.executeQuery();
    rs3 = ps3.getResultSet();
    ps5.setInt(1, coderType);
    ps5.executeQuery();
    rs5 = ps5.getResultSet();
    ps4.setInt(1, coderType);
    ps4.executeQuery();
    rs4 = ps4.getResultSet();

    if (rs4.next())
    {
      coderCount = rs4.getInt(1);
      out.println("<table class=\"srmFrame\" width=300><tr><td colspan=3 class=srmQuestion>Total Count: " + coderCount + "</td></tr>");
      out.println("<br><br>");
	  out.println("</table><br><br>");
    }
    rs4.close();

    ArrayList stringArray = null;
    ArrayList intArray = null;
    DecimalFormat df = new DecimalFormat("0.00%");

    stringArray = new ArrayList();
    intArray = new ArrayList();
    while (rs3.next())
    { 
      String ansText = rs3.getString(1);
      int ansCnt = rs3.getInt(2);
      stringArray.add(ansText);
      intArray.add(new Integer(ansCnt));
    }
    rs3.close();
    int total = getTotal(intArray);
    overallTotal = total;
	boolean even=false;
    out.println("<table class=\"srmFrame\" width=300><tr><td colspan=3 class=srmQuestion>How did you hear about TopCoder?</td></tr>");
    for(int x=0;x<stringArray.size();x++)
    {
      out.println("<tr>");
      String tempAns = (String)stringArray.get(x);
      Integer tempCnt = (Integer)intArray.get(x);
      double pct = (double)tempCnt.intValue()/(double)total;
      //out.println("  " + tempAns + "  " + tempCnt.intValue());
      out.println("<td class=\"" + (even?"srmTableEven":"srmTableOdd") + "\">" + tempAns + "</td><td class=\"" + (even?"srmTableEven":"srmTableOdd") + "\">" + df.format(pct) + "</td><td align=right class=\"" + (even?"srmTableEven":"srmTableOdd") + "\">" + tempCnt.intValue() + "</td>");
      out.println("</tr>");
	  even=!even;
    }
	out.println("</table><br><br>");
    stringArray = new ArrayList();
    intArray = new ArrayList();
    if (rs5.next())
    {
      int ansCnt = rs5.getInt(1);
      String ansText = "Yes";
      stringArray.add(new String(ansText));
      intArray.add(new Integer(ansCnt));

      int ansCnt2 = overallTotal - ansCnt;
      ansText = "No";

      stringArray.add(new String(ansText));
      intArray.add(new Integer(ansCnt2));
      
    }
    rs5.close();
    total = getTotal(intArray);
	even=false;
    out.println("<table class=\"srmFrame\" width=300><tr><td colspan=3 class=srmQuestion>Receive Notification Emails?</td></tr>");
    for(int x=0;x<stringArray.size();x++)
    {
	  out.println("<tr>");
      String tempAns = (String)stringArray.get(x);
      Integer tempCnt = (Integer)intArray.get(x);
      double pct = (double)tempCnt.intValue()/(double)total;
      //out.println("  " + tempAns + "  " + tempCnt.intValue());
      out.println("<td class=\"" + (even?"srmTableEven":"srmTableOdd") + "\">" + tempAns + "</td><td class=\"" + (even?"srmTableEven":"srmTableOdd") + "\">" + df.format(pct) + "</td><td align=right class=\"" + (even?"srmTableEven":"srmTableOdd") + "\">" + tempCnt.intValue() + "</td>");
      out.println("</tr>");
	  even=!even;
	}
	out.println("</table><br><br>");


    while (rs.next())
    {
      quesId = rs.getInt("demographic_question_id");
      quesText = rs.getString("demographic_question_text");


      ps2.clearParameters();
      ps2.setInt(1, coderType);
      ps2.setInt(2, quesId);
      ps2.executeQuery();
      rs2 = ps2.getResultSet();

      stringArray = new ArrayList();
      intArray = new ArrayList();

      while (rs2.next())
      {
        String ansText = rs2.getString(1);
        int ansCnt = rs2.getInt(3);

        stringArray.add(ansText);
        intArray.add(new Integer(ansCnt));
        //out.println("  " + ansText + "  " + ansCnt);
      }
      rs2.close();

      intArray = checkTotal(intArray, coderCount);

      total = getTotal(intArray);

      //out.println(quesText + " " + total);
	  even=false;
      out.println("<table class=\"srmFrame\" width=300><tr><td colspan=3 class=srmQuestion>" + quesText + "</td></tr>");
      for(int x=0;x<stringArray.size();x++)
      {
	  	out.println("<tr>");
        String tempAns = (String)stringArray.get(x);
        Integer tempCnt = (Integer)intArray.get(x);
        double pct = (double)tempCnt.intValue()/(double)total;
        out.println("<td class=\"" + (even?"srmTableEven":"srmTableOdd") + "\">" + tempAns + "</td><td class=\"" + (even?"srmTableEven":"srmTableOdd") + "\">" + df.format(pct) + "</td><td align=right class=\"" + (even?"srmTableEven":"srmTableOdd") + "\">" + Math.round((double)coderCount*(double)pct) + "</td>");
		out.println("</tr>");
		even=!even;
      }
      out.println("</table><br><br>");


    }

    try{
      rs.close();
      ps.close();
      ps2.close();
      ps3.close();
      ps4.close();
      conn.close();
    }catch(Exception e){ 
      e.printStackTrace();
    }
  }

  //////////////////////////////////////////////////////////////////////////////// 
  private static int getTotal(ArrayList in)
  //////////////////////////////////////////////////////////////////////////////// 
  {
    int total = 0;
    for(int x=0;x<in.size();x++)
    {
      Integer integerx = (Integer)in.get(x);
      total = total + integerx.intValue();
    }
    return total;
  }

  ////////////////////////////////////////////////////////////////////////////////
  private static ArrayList checkTotal(ArrayList in, int targetVal)
  ////////////////////////////////////////////////////////////////////////////////
  {
    ArrayList retVal = new ArrayList();
    int currVal = getTotal(in);
    int maxVal = 0;
    int maxPtr = 0;

    //out.println("ARRAY CHECK: TARG: " + targetVal + "  CURR: " + currVal);

    if (currVal != targetVal)
    {
      for(int x=0;x<in.size();x++)
      {
        Integer integerx = (Integer)in.get(x);
        int intVal = integerx.intValue();

        double pct = (double)intVal/(double)currVal;
        int newVal = (int)Math.round((double)targetVal*(double)pct);
        retVal.add(new Integer(newVal));

        if (newVal > maxVal)
        {
          maxVal = newVal;
          maxPtr = x;
        }

      }
    }
    else
    {
      return in;
    }
    //out.println("ARRAY CHECK: TARG: " + targetVal + "  CURR: " + currVal);

    currVal = getTotal(retVal);
    if (currVal != targetVal)
    {
      //out.println("MAXPTR: " + maxPtr);
      //out.println("MAXVAL: " + (Integer)retVal.get(maxPtr));
      //out.println("MAXVAL2: " + maxVal);
      //out.println("NEW: " + new Integer(maxVal+(targetVal-currVal)));

      retVal.set(maxPtr, new Integer(maxVal+(targetVal-currVal)));

      //out.println("NEWMAXVAL: " + (Integer)retVal.get(maxPtr));
    }
    currVal = getTotal(retVal);
    //out.println("ARRAY CHECK: TARG: " + targetVal + "  CURR: " + currVal);

    return retVal;
	
  }
%>

<table class="srmFrame">
<tr>
<td class=sectionTitle>Students</td>
<td class=sectionTitle width="40">&nbsp;&nbsp;</td>
<td class=sectionTitle>Professionals</td></tr>
<tr>
	<td valign="top"><%doit(out,1,Integer.parseInt(request.getParameter("rd")));%></td>
	<td width="40">&nbsp;&nbsp;</td>
	<td valign="top"><%doit(out,2,Integer.parseInt(request.getParameter("rd")));%></td>
</tr>
</table>

