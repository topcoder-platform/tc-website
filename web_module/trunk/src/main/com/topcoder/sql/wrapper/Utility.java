package com.topcoder.sql.wrapper;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: mmurphy
 * Date: Nov 21, 2003
 * Time: 5:35:45 PM
 * To change this template use Options | File Templates.
 */
public class Utility {

    private long maxAge = 30000; // 30 seconds

    public Utility() {
    }

    public Utility(long maxAge) {
        this.maxAge = maxAge;
    }

    public long getMaxAge() {
        return maxAge;
    }

    public void setMaxAge(long maxAge) {
        this.maxAge = maxAge;
    }

    public void printAll(PrintWriter printWriter) {
        printWriter.print("<tr><td><b>Object</b></td>");
        printWriter.print("<td><b>Type</b></td>");
        printWriter.print("<td><b>Status</b></td>");
        printWriter.print("<td><b>Age</b></td><td></td></tr>");
        List exceptions = new ArrayList();
        DriverWrapper[] driverWrappers = DriverWrapper.getDriverWrappers();
        for (int d = 0; d < driverWrappers.length; d++) {
            printDriverWrapper(printWriter, driverWrappers[d]);
            ConnectionWrapper[] connectionWrappers = driverWrappers[d].getConnectionWrappers();
            for (int c = 0; c < connectionWrappers.length; c++) {
                SQLException sqle = printConnectionWrapper(printWriter, connectionWrappers[c]);
                if (sqle != null) exceptions.add(sqle);
                StatementWrapper[] statementWrappers = connectionWrappers[c].getStatementWrappers();
                for (int s = 0; s < statementWrappers.length; s++) {
                    printStatementWrapper(printWriter, statementWrappers[s]);
//                    ResultSetWrapper[] resultSetWrappers = statementWrappers[s].getResultSetWrappers();
//                    for (int r = 0; r < resultSetWrappers.length; r++) {
//                        printResultSetWrapper(printWriter, resultSetWrappers[r]);
//                    }
                }
            }
        }
        for (int e = 0; e < exceptions.size(); e++) {
            if (e == 0) printWriter.print("<tr><td colspan=\"5\"><pre>Respective SQLExceptions follow:");
            ((SQLException) exceptions.get(e)).printStackTrace(printWriter);
            if (e + 1 == exceptions.size())
                printWriter.print("</pre></td></tr>");
            else
                printWriter.println("====================================================================");
        }
    }

    public void printDriverWrapper(PrintWriter printWriter, DriverWrapper d) {
        printWriter.print("<tr><td><input type=\"checkbox\" name=\"driverId\" value=\"" + d.getId() + "\"");
        printWriter.print(" disabled");
        printWriter.print(">");
        printWriter.print(d.toString());
        printWriter.print("(" + d.getDriver().toString() + ")</td><td>Driver</td><td>");
        printWriter.print("</td><td colspan=\"2\"></td></tr>");
    }

    public SQLException printConnectionWrapper(PrintWriter printWriter, ConnectionWrapper c) {
        SQLException rv = null;
        long age = c.getAge();
        int closed;
        try {
            if (c.isClosed())
                closed = 1;
            else
                closed = 0;
        } catch (SQLException sqle) {
            closed = -1;
            rv = sqle;
        }
        printWriter.print("<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"connectionId\" value=\"" + c.getId() + "\"");
//   We don't want to autoselect Connections
//        if (closed != 0) printWriter.print(" disabled");
//        else if (c.getAge() > maxAge) printWriter.print(" checked");
        printWriter.print(" disabled");
        printWriter.print(">");
        printWriter.print("<a href=\"driverWrapper.jsp?t=stackTrace&connectionId=" + c.getId() + "\">");
        printWriter.print(c.getConnection().toString() + "</a></td><td>Connection</td><td>");
        switch (closed) {
            case 1:
                printWriter.print("CLOSED");
                break;
            case 0:
                printWriter.print("OPEN");
                break;
            case -1:
                printWriter.print("SQLException");
                break;
            default:
                break;
        }
        printWriter.print("</td><td>" + age + "</td><td>");
//        if (closed == 0) printWriter.print("<a href=\"driverWrapper.jsp?task=close&connectionId=" + c.getId() + "\">close</a>");
        printWriter.print("</td></tr>");
        return rv;
    }

    public void printStatementWrapper(PrintWriter printWriter, StatementWrapper s) {
        boolean closed = s.isClosed();
        long age = s.getAge();
        printWriter.print("<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"statementId\" value=\"" + s.getId() + "\"");
        if (closed)
            printWriter.print(" disabled");
        else if (age > maxAge) printWriter.print(" checked");
        printWriter.print(">");
        printWriter.print("<a href=\"driverWrapper.jsp?t=stackTrace&statementId=" + s.getId() + "\">");
        printWriter.print(s.getStatement().toString() + "</a></td><td>Statement</td><td>");
        printWriter.print(closed ? "CLOSED" : "OPEN");
        printWriter.print("</td><td>" + age + "</td><td>");
        if (!closed) printWriter.print("<a href=\"driverWrapper.jsp?t=close&statementId=" + s.getId() + "\">close</a>");
        printWriter.print("</td></tr>");
    }

    public void printResultSetWrapper(PrintWriter printWriter, ResultSetWrapper r) {
        boolean closed = r.isClosed();
        long age = r.getAge();
        printWriter.print("<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"resultSetId\" value=\"" + r.getId() + "\"");
        if (closed)
            printWriter.print(" disabled");
        else if (age > maxAge) printWriter.print(" checked");
        printWriter.print(">");
        printWriter.print("<a href=\"driverWrapper.jsp?t=stackTrace&resultSetId=" + r.getId() + "\">");
        printWriter.print(r.getResultSet().toString() + "</a></td><td>ResultSet</td><td>");
        printWriter.print(closed ? "CLOSED" : "OPEN");
        printWriter.print("</td><td>" + age + "</td><td>");
        if (!closed) printWriter.print("<a href=\"driverWrapper.jsp?t=close&resultSetId=" + r.getId() + "\">close</a>");
        printWriter.print("</td></tr>");
    }
}
