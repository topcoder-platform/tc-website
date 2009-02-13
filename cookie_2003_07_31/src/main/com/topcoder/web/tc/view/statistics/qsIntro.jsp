<%@ page language="java" %>
                  <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                    <TR>
                      <TD ROWSPAN="2" CLASS="statText" VALIGN="top" WIDTH="100%">
                        <P CLASS="statText">
                          The following data is available to both members and non-members.
                          Members are given a deeper view of statistics as well as the ability
                          to review individual member history, submissions, and of course,
                          statistics. Login now if you are a member, or <A HREF="#" CLASS="statText">Register today!</A>
                        </P>
                      </TD>
                      <TD ROWSPAN="2" CLASS="statText" VALIGN="top" WIDTH="20"><IMG src="/i/clear.gif" WIDTH="20" HEIGHT="1" BORDER="0"/></TD>
                      <TD CLASS="statTextBig" VALIGN="top" WIDTH="170"><B>Quick Stats:</B>
                      <IMG src="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="1"/><BR/>
                      </TD>
                    </TR>
                    <TR>
                      <TD VALIGN="top" WIDTH="170" CLASS="statTextBig">
                      <!-- Quick Stat Pulldown Begins -->
            <form name="QSTATFORM">
                        <select name="quickstat" onchange="goTo(this)" size="1" class="dropdown">
                          <OPTION value="#" selected> Select a Stat: </OPTION>
                          <jsp:include page="qsList.jsp" />
                        </select>
                     <!-- Quick Stat Pulldown Ends -->
                      </TD>
                    </TR>
          <TR><TD COLSPAN="3" CLASS="statText"><br><%@include file="coderLegend.html" %>
          </TD></TR>
                  </TABLE>
