package com.topcoder.utilities;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;

import javax.sql.DataSource;
import javax.naming.Context;
import java.io.*;
import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 6, 2005
 */
public class EmailSender {
    private static final String GCCJ05_PROD = "jdbc:informix-sqli://192.168.14.51:2020/gcj_china_05_oltp:INFORMIXSERVER=informixol" +
            "tp_tcp;user=coder;password=teacup";
    private static final String GCCJ05_TRANS =
            "jdbc:informix-sqli://172.16.20.25:1526/gcj_china_05_oltp:INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=altec";

    private static final String senderEmail = "gcjc@topcoder.com";
    private static final String senderName = "Google Code Jam China";
    private String dataSource = null;

    public static void main(String[] args) {
        long id= 0;
            try {
                EmailSender e = new EmailSender();

                e.setDataSource(GCCJ05_PROD);
                if (args.length>0&&args[0].equals("dev")) {
                    e.setDataSource(GCCJ05_TRANS);
                }

                while (true) {
                    List jobs = e.getJobs();
                    for (int i=0; i<jobs.size(); i++) {
                        id= ((Long)jobs.get(i)).longValue();
                        log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
                        log("starting job " + id);
                        log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");

                        String fileName = e.getFileName(id);
                        String content = e.getFile(fileName);
                        ResultSetContainer recipients = e.getRecipients(e.getCommand(id));
                        log("got " + recipients.size() + " recipients");
                        String subject = e.getSubject(fileName);
                        int successCount = 0;
                        int failCount = 0;
                        long start = System.currentTimeMillis();
                        for (Iterator it = recipients.iterator(); it.hasNext();) {
                            if (e.send((ResultSetContainer.ResultSetRow) it.next(), content, subject)) {
                                successCount++;
                            } else {
                                failCount++;
                            }
                        }
                        long end = System.currentTimeMillis();
                        log("job " + id + " sent " + successCount + " emails, " + failCount + " failed.  it took " + (float) (end - start) / (float) 1000 + " seconds");
                        e.markComplete(id);
                    }
                    Thread.sleep(1000*60);
                }

            } catch (Exception e) {
                try {
                    TCSEmailMessage message = new TCSEmailMessage();
                    message.setFromAddress(senderEmail, senderName);
                    message.setSubject("error sending email" + ((id>0)?"on job " + id:""));
                    message.addToAddress("gpaul@topcoder.com", TCSEmailMessage.TO);
                    //buf.append("Hello ").append(recipient.getStringItem("handle")).append(",\n\n");
                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
                    e.printStackTrace(new PrintStream(baos));
                    message.setBody(baos.toString());
                    EmailEngine.send(message);
                } catch (Exception ignore) {
                }
                e.printStackTrace();
                System.exit(1);
            }
    }

    public void setDataSource(String dataSource) {
        //log("set datasource " + dataSource);
        this.dataSource = dataSource;
    }

    private List getJobs() throws ClassNotFoundException, SQLException {
        DataSource d = new InformixSimpleDataSource(dataSource);
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        ArrayList ret = new ArrayList(10);
        try {
            conn = d.getConnection();
            String select = "select id from china_email where start_date < current and processed = 0";
            ps = conn.prepareStatement(select);
            rs = ps.executeQuery();
            while (rs.next()) {
                ret.add(new Long(rs.getLong("id")));
            }
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
        return ret;
    }

    private boolean send(ResultSetContainer.ResultSetRow recipient, String text, String subject) {
        try {
            TCSEmailMessage message = new TCSEmailMessage();
            message.setFromAddress(senderEmail, senderName);
            message.setSubject(subject);
            message.addToAddress(recipient.getStringItem("address"), TCSEmailMessage.TO);
            StringBuffer buf = new StringBuffer(text.length() + 50);
            buf.append(recipient.getStringItem("handle")).append(",\n\n");
            buf.append(text);
            message.setBody(buf.toString());
            EmailEngine.send(message);
            log("send email to " + recipient.getStringItem("address"));
            return true;
        } catch (Exception e) {
            log("failed email to " + recipient.getStringItem("address"));
            return false;
        }
    }

    private String getSubject(String fileName) throws IOException {
        StringBuffer buf = new StringBuffer(1000);
        BufferedReader ir = new BufferedReader(new FileReader(fileName));
        if (ir.ready()) {
            buf.append(ir.readLine());
        }
        ir.close();
        return new String(buf.toString().getBytes(), "utf-8");

    }

    private String getFile(String fileName) throws IOException {
        StringBuffer buf = new StringBuffer(1000);
        BufferedReader ir = new BufferedReader(new FileReader(fileName));
        int i=0;
        while (ir.ready()) {
            //skip the subject, we're assuming it's the first line
            String line = ir.readLine()+"\n";
            if (i>0) {
                buf.append(line);
            }
            i++;
        }
        ir.close();
        return new String(buf.toString().getBytes(), "utf-8");

    }

    private String getFileName(long id) throws Exception, ClassNotFoundException, SQLException {

        DataSource d = new InformixSimpleDataSource(dataSource);
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            conn = d.getConnection();
            String select = "select file_name from china_email where id = ?";
            ps = conn.prepareStatement(select);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("file_name");
            } else {
                throw new Exception("couldn't find file name for id " + id);
            }
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }

    private String getCommand(long id) throws Exception, ClassNotFoundException, SQLException {

        DataSource d = new InformixSimpleDataSource(dataSource);
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            conn = d.getConnection();
            String select = "select command from china_email where id = ?";
            ps = conn.prepareStatement(select);
            ps.setLong(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("command");
            } else {
                throw new Exception("couldn't find command for id " + id);
            }
        } finally {
            close(rs);
            close(ps);
            close(conn);
        }
    }

    private ResultSetContainer getRecipients(String command) throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle(command);
        DataAccessInt dai = new DataAccess(new InformixSimpleDataSource(dataSource));
        return (ResultSetContainer) dai.getData(dataRequest).get(command);
    }

    private void markComplete(long id) throws Exception {
        DataSource d = new InformixSimpleDataSource(dataSource);
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = d.getConnection();
            String update = "update china_email set processed = 1 where id = ?";
            ps = conn.prepareStatement(update);
            ps.setLong(1, id);
            int ret = ps.executeUpdate();
            if (ret!=1) {
                throw new Exception("updated " + ret + " rows not one when attempting to set processed flag on id " + id);
            }
        } finally {
            close(ps);
            close(conn);
        }
    }

    private static void log(Object o) {
        System.out.println(o.toString());
    }

    protected void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }
    }

    protected void close(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

    }

    protected void close(Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

    }

    protected void close(PreparedStatement ps) {
        if (ps != null) {
            try {
                ps.close();
            } catch (Exception ignore) {
                ignore.printStackTrace();
            }
        }

    }





}
