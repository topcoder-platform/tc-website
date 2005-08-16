/*
 * ServerPauseBot.java
 *
 * Created on February 21, 2005, 2:41 PM
 */

package com.topcoder.utilities;

import java.io.File;
import java.io.InputStream;
import java.io.File;
import java.util.*;

/**
 *
 * @author rfairfax
 */
public class ServerPauseBot {

    /** Creates a new instance of ServerPauseBot */
    public ServerPauseBot() {
    }

    public static void main(String[] args) {
        ServerPauseBot client = new ServerPauseBot();
        client.run();
    }

    public boolean fiveone = true;
    public boolean fivetwo = true;

    public void run() {
        System.out.println("STATUS,TIME_IN_MS");
        while (true) {
            try {
                Runtime r = Runtime.getRuntime();

                long time = System.currentTimeMillis();
                String[] callAndArgs = {"wget",
                                        "http://192.168.12.51:7030",
                                        "--header=Host: www.topcoder.com",
                                        "--timeout=30",
                                        "-t1",
                                        ""};

                Process p = r.exec(callAndArgs);
                p.waitFor();
                time = System.currentTimeMillis() - time;

                String ret = getData(p.getErrorStream());
                p.destroy();

                if (ret.indexOf("failed") != -1) {
                    System.out.println(new Date().toString() + " FAILED," + time);
                } else if (ret.indexOf("200 OK") == -1) {
                    System.out.println(new Date().toString() + " FAILED," + time);
                } else {
                    System.out.println(new Date().toString() + " SUCCEEDED," + time);
                }

                //delete file
                try {
                    File f = new File("index.html");
                    f.delete();
                } catch (Exception e) {

                }


            } catch (Exception e) {
                e.printStackTrace();
            }

            wait(10); // 10 sec
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
        System.out.println("ADDING ERROR");
        errorText += message + "\n";
        errorTextLarge += message + "\n";
    }

    public static void addErrorLarge(String message) {
        errorTextLarge += message + "\n";
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
