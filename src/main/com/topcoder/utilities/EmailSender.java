package com.topcoder.utilities;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.sql.InformixSimpleDataSource;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 6, 2005
 */
public class EmailSender {
    private static final String GCCJ05_PROD = "jdbc:informix-sqli://192.168.14.51:2020/gcj_china_05_oltp:INFORMIXSERVER=informixol" +
            "tp_tcp;user=coder;password=teacup";
    private static final String DEV_TRANS =
            "jdbc:informix-sqli://65.112.118.221:1526/informixoltp:INFORMIXSERVER=devinformix10_shm;user=coder;password=altec";
    private static final String GCCJ05_TRANS =
            "jdbc:informix-sqli://172.16.20.25:1526/gcj_china_05_oltp:INFORMIXSERVER=tc_memeber_dev_tcp;user=coder;password=altec";

    private static final String senderEmail = "gcjc@topcoder.com";
    private static final String senderName = "Google Code Jam China";

    public static void main(String[] args) {
        if (args.length != 3) {
            log("usage: " + EmailSender.class + " <filename> <command> <subject>");
            System.exit(1);
        } else {
            try {
                EmailSender e = new EmailSender();
                String content = e.getFile(args[0]);
                //log("got content");
                ResultSetContainer recipients = e.getRecipients(args[1]);
                log("got " + recipients.size() + " recipients");
                String subject = args[2];
                //log("got subject");
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
                log("sent " + successCount + " emails, " + failCount + " failed.  it took " + (float) (end - start) / (float) 1000 + " seconds");
                System.exit(0);
            } catch (Exception e) {
                e.printStackTrace();
                System.exit(1);
            }
        }
    }

    private boolean send(ResultSetContainer.ResultSetRow recipient, String text, String subject) {
        try {
            log("send email to " + recipient.getStringItem("address"));
            TCSEmailMessage message = new TCSEmailMessage();
            message.setFromAddress(senderEmail, senderName);
            message.setSubject(subject);
            message.addToAddress(recipient.getStringItem("address"), TCSEmailMessage.TO);
            StringBuffer buf = new StringBuffer(text.length() + 50);
            //buf.append("Hello ").append(recipient.getStringItem("handle")).append(",\n\n");
            buf.append(text);
            message.setBody(buf.toString());
            EmailEngine.send(message);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private String getFile(String fileName) throws IOException {
        StringBuffer buf = new StringBuffer(1000);
        BufferedReader ir = new BufferedReader(new FileReader(fileName));
        while (ir.ready()) {
            buf.append(ir.readLine());
            buf.append("\n");
        }
        ir.close();
        return new String(buf.toString().getBytes(), "utf-8");

    }

    private ResultSetContainer getRecipients(String command) throws Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle(command);
        DataAccessInt dai = new DataAccess(new InformixSimpleDataSource(GCCJ05_PROD));
        return (ResultSetContainer) dai.getData(dataRequest).get(command);
    }

    private static void log(Object o) {
        System.out.println(o.toString());
    }
}
