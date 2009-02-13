/*
 * ServerMonitorBot.java
 *
 * Created on August 30, 2004, 2:03 PM
 */

package com.topcoder.utilities;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;

import java.io.File;
import java.io.InputStream;

/**
 * @author rfairfax
 */
public class ServerMonitorBot {
    private static final Logger log = Logger.getLogger(ServerMonitorBot.class);

    /**
     * Creates a new instance of ServerMonitorBot
     */
    public ServerMonitorBot() {
    }

    public static void main(String[] args) {
        ServerMonitorBot client = new ServerMonitorBot();
        client.run();
    }

    private boolean isTCAlive = true;
    private boolean isSoftwareAlive = true;
    private boolean isStudioAlive = true;
    private boolean isForumsAlive = true;

    public void run() {

        while (true) {
            try {
                Runtime r = Runtime.getRuntime();

                log.info("STARTING");
                String[] callAndArgs = {"wget",
                        "http://www.topcoder.com",
                        "--header=Host: www.topcoder.com",
                        "--timeout=30",
                        "-t3",
                        ""};

                Process p = r.exec(callAndArgs);
                p.waitFor();

                String ret = getData(p.getErrorStream());
                p.destroy();


                log.info("1:" + ret + "\n" + p.exitValue());

                if (ret.indexOf("failed") != -1) {
                    if (isTCAlive) {
                        isTCAlive = false;
                        log.warn("FAILED, SENDING MAIL");
                        addError("connection to wwww.topcoder.com failed");
                        sendError();
                    }
                } else if (ret.indexOf("200 OK") == -1) {
                    if (isTCAlive) {
                        isTCAlive = false;
                        log.warn("FAILED, SENDING MAIL");
                        addError("response from wwww.topcoder.com failed");
                        addErrorLarge(ret);
                        sendError();
                    }
                } else {
                    isTCAlive = true;
                }

                //delete file
                wack();

                String[] callAndArgs2 = {"wget",
                        "http://software.topcoder.com",
                        "--timeout=30",
                        "-t3",
                        ""};

                p = r.exec(callAndArgs2);
                p.waitFor();

                ret = getData(p.getErrorStream());
                p.destroy();

                log.info("2:" + ret + "\n" + p.exitValue());

                if (ret.indexOf("failed") != -1) {
                    if (isSoftwareAlive) {
                        isSoftwareAlive = false;
                        log.warn("FAILED, SENDING MAIL");
                        addError("connection to software failed");
                        sendError();
                    }
                } else if (ret.indexOf("200 OK") == -1) {
                    if (isSoftwareAlive) {
                        isSoftwareAlive = false;
                        log.warn("FAILED, SENDING MAIL");
                        addError("response from software failed");
                        addError(ret);
                        sendError();
                    }
                } else {
                    isSoftwareAlive = true;
                }

                wack();

                String[] callAndArgs3 = {"wget",
                        "http://forums.topcoder.com",
                        "--timeout=30",
                        "-t3",
                        ""};

                p = r.exec(callAndArgs3);
                p.waitFor();

                ret = getData(p.getErrorStream());
                p.destroy();

                log.info("2:" + ret + "\n" + p.exitValue());

                if (ret.indexOf("failed") != -1) {
                    if (isForumsAlive) {
                        isForumsAlive = false;
                        log.warn("FAILED, SENDING MAIL");
                        addError("connection to forums failed");
                        sendError();
                    }
                } else if (ret.indexOf("200 OK") == -1) {
                    if (isForumsAlive) {
                        isForumsAlive = false;
                        log.warn("FAILED, SENDING MAIL");
                        addError("response from forums failed");
                        addError(ret);
                        sendError();
                    }
                } else {
                    isForumsAlive = true;
                }

                wack();

                String[] callAndArgs4 = {"wget",
                        "http://studio.topcoder.com",
                        "--timeout=30",
                        "-t3",
                        ""};

                p = r.exec(callAndArgs4);
                p.waitFor();

                ret = getData(p.getErrorStream());
                p.destroy();

                log.info("2:" + ret + "\n" + p.exitValue());

                if (ret.indexOf("failed") != -1) {
                    if (isStudioAlive) {
                        isStudioAlive = false;
                        log.warn("FAILED, SENDING MAIL");
                        addError("connection to studio failed");
                        sendError();
                    }
                } else if (ret.indexOf("200 OK") == -1) {
                    if (isStudioAlive) {
                        isStudioAlive = false;
                        log.warn("FAILED, SENDING MAIL");
                        addError("response from studio failed");
                        addError(ret);
                        sendError();
                    }
                } else {
                    isStudioAlive = true;
                }

                wack();


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
    private static String errorTextLarge = "";

    public static void addError(String message) {
        log.info("ADDING ERROR");
        errorText += message + "\n";
        errorTextLarge += message + "\n";
    }

    public static void addErrorLarge(String message) {
        errorTextLarge += message + "\n";
    }

    public void sendError() {
        if (!errorText.equals("")) {
            log.info("short text \n" + errorText);
            log.info("long text \n" + errorTextLarge);
            try {
                TCSEmailMessage em = new TCSEmailMessage();
                em.addToAddress("mobile_on_call@topcoder.com", TCSEmailMessage.TO);

                em.setSubject("Server Error");
                em.setBody(errorText);
                em.setFromAddress("rfairfax@topcoder.com");

                EmailEngine.send(em);

                em = new TCSEmailMessage();
                em.addToAddress("email_on_call@topcoder.com", TCSEmailMessage.TO);
                em.setSubject("Server Error");
                em.setBody(errorTextLarge);
                em.setFromAddress("rfairfax@topcoder.com");

                EmailEngine.send(em);
            } catch (Exception e) {
                log.error("HERE" + e.getClass());
                e.printStackTrace();
            }
        }
        errorText = "";
        errorTextLarge = "";
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

    private void wack() {
                        File[] files = new File(".").listFiles();
                int i=0;
                try {
                    for (; i<files.length; i++) {
                        if (files[i].getName().startsWith("index")) {
                            files[i].delete();
                        }
                    }
                } catch (Exception e) {
                    log.debug("error deleting " + files[i] + " " + e.getMessage());
                }
    }
}
