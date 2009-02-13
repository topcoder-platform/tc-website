/*
 * ServerMonitorBot.java
 *
 * Created on August 30, 2004, 2:03 PM
 */

package com.topcoder.utilities;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;

import java.io.InputStream;

/**
 *
 * @author  rfairfax
 */
public class ServerMonitorBot {

    /** Creates a new instance of ServerMonitorBot */
    public ServerMonitorBot() {
    }

    public static void main(String[] args) {
        ServerMonitorBot client = new ServerMonitorBot();
        client.run();
    }

    public boolean fiveone = true;
    public boolean fivetwo = true;

    public void run() {
        while (true) {
            try {
                Runtime r = Runtime.getRuntime();

                System.out.println("STARTING");
                String[] callAndArgs = {"wget",
                                        "http://192.168.12.51:7030",
                                        "--header=Host: www.topcoder.com",
                                        "--timeout=30",
                                        "-t1",
                                        "--spider"};

                Process p = r.exec(callAndArgs);
                p.waitFor();

                String ret = getData(p.getErrorStream());

                System.out.println("1:" + ret);
                System.out.println(p.exitValue());

                if (ret.indexOf("failed") != -1) {
                    if (fiveone) {
                        fiveone = false;
                        System.out.println("FAILED, SENDING MAIL");
                        addError("connetion to 12.51 failed");
                        sendError();
                    }
                } else if (ret.indexOf("200 OK") == -1) {
                    if (fiveone) {
                        fiveone = false;
                        System.out.println("FAILED, SENDING MAIL");
                        addError("response from 12.51 failed");
                        addError(ret);
                        sendError();
                    }
                } else {
                    fiveone = true;
                }

                String[] callAndArgs2 = {"wget",
                                         "http://192.168.12.52:7030",
                                         "--header=Host: www.topcoder.com",
                                         "--timeout=30",
                                         "-t1",
                                         "--spider"};

                p = r.exec(callAndArgs2);
                p.waitFor();

                ret = getData(p.getErrorStream());
                System.out.println("2:" + ret);
                System.out.println(p.exitValue());

                if (ret.indexOf("failed") != -1) {
                    if (fivetwo) {
                        fivetwo = false;
                        System.out.println("FAILED, SENDING MAIL");
                        addError("connetion to 12.52 failed");
                        sendError();
                    }
                } else if (ret.indexOf("200 OK") == -1) {
                    if (fivetwo) {
                        fivetwo = false;
                        System.out.println("FAILED, SENDING MAIL");
                        addError("response from 12.51 failed");
                        addError(ret);
                        sendError();
                    }
                } else {
                    fivetwo = true;
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            wait(5 * 60); // 5 minutes
        }
    }

    public String getData(InputStream in) {
        StringBuffer ret = new StringBuffer();
        try {
            int byte_count = 0;
            byte byte_buffer[] = new byte[512];
            while ((byte_count = in.read(byte_buffer)) > 0)
                ret.append(new String(byte_buffer, 0, byte_count));
        } catch (Exception e) {

        }

        return ret.toString();
    }

    private static String errorText = "";

    public static void addError(String message) {
        System.out.println("ADDING ERROR");
        errorText += message + "\n";
    }

    public void sendError() {
        if (!errorText.equals("")) {
            System.out.println("SENDING ERROR LOG");
            try {
                TCSEmailMessage em = new TCSEmailMessage();
                em.addToAddress("rfairfax@topcoder.com", TCSEmailMessage.TO);
                em.addToAddress("mlydon@topcoder.com", TCSEmailMessage.TO);
                em.addToAddress("gpaul@topcoder.com", TCSEmailMessage.TO);
                em.addToAddress("8604656205@mobile.mycingular.com", TCSEmailMessage.TO);
                em.addToAddress("8602686127@messaging.sprintpcs.com", TCSEmailMessage.TO);
                em.addToAddress("8606144043@vtext.com", TCSEmailMessage.TO);

                em.setSubject("Server Error");
                em.setBody(errorText);
                em.setFromAddress("rfairfax@topcoder.com");

                EmailEngine.send(em);
            } catch (Exception e) {
                System.out.println("HERE" + e.getClass());
                e.printStackTrace();
            }
        }
        errorText = "";
    }

    /**
     * utility method to wait for an event to occur
     */
    private boolean sem = false;

    boolean wait(int cnt) {
        sem = false;
        while (sem == false && cnt > 0) {
            try {
                Thread.sleep(1000);
            } catch (Exception ex) {
                return false;
            }
            cnt--;
        }
        return cnt > 0;

    }

    void done() {
        sem = true;
    }
}
