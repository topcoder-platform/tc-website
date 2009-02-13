/*
 * ServerMonitorBot.java
 *
 * Created on August 30, 2004, 2:03 PM
 */

package com.topcoder.utilities;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

/**
 * @author rfairfax,dok
 */
public class ServerMonitorBot {

    static final Logger log = Logger.getLogger(ServerMonitorBot.class);
    private boolean testing = false;

    private String[] addresses = {
            "mobile_on_call@topcoder.com",
            "email_on_call@topcoder.com"};
    private String[] testingAddresses = {
            "dok@topcoder.com", "dok@topcoder.com"
    };

    private final static int SHORT_LIST = 0;
    private final static int LONG_LIST = 1;

    /**
     * Creates a new instance of ServerMonitorBot
     */
    public ServerMonitorBot() {
    }

    public static void main(String[] args) {
        ServerMonitorBot client = new ServerMonitorBot();
        client.run();
    }

    private final static PollInfo[] sites = {
            new PollInfo(true, "http://www.topcoder.com", "tc", 30)
            , new PollInfo(true, "http://software.topcoder.com", "software", 30)
            , new PollInfo(true, "http://forums.topcoder.com", "fdorums", 60)
            , new PollInfo(true, "http://studio.topcoder.com", "studio", 30)
            , new PollInfo(true, "http://www.topcoder.com/wiki", "wiki", 30)
            , new PollInfo(true, "http://www.topcoder.com/time", "time tracker", 30)
            , new PollInfo(true, "http://www.topcoder.com/openaim", "open aim", 30)
            , new PollInfo(true, "http://www.topcoder.com/bugs", "bug tracker", 30)
            , new PollInfo(true, "http://www.topcoder.com/longcontest", "marathon matches", 30)
            , new PollInfo(true, "http://www.topcoder.com/education", "educational platform", 30)
            , new PollInfo(true, "http://software.topcoder.com/pipeline", "pipeline tool", 30)
    };

    public void run() {

        while (true) {
            try {

                log.info("STARTING");
                for (PollInfo site : sites) {
                    testSite(site);
                }
                recordUptimeData(sites);

            } catch (Exception e) {
                e.printStackTrace();
            }

            wait(5 * 60); // 5 minutes
        }
    }

    private void recordUptimeData(PollInfo[] p) throws IOException {
        log.info("recording update data");
        File f = getCurrentFile();
        List<UptimeInfo> infoList = readCurrentInfo();

        HashMap<String, UptimeInfo> infoMap = new HashMap<String, UptimeInfo>();
        for (UptimeInfo info : infoList) {
            infoMap.put(info.getKey(), info);
        }

        UptimeInfo tempInfo = null;
        for (PollInfo site : p) {
            tempInfo = infoMap.get(site.getSiteName());
            if (tempInfo == null) {
                tempInfo = new UptimeInfo();
                tempInfo.setKey(site.getSiteName());
                infoMap.put(site.getSiteName(), tempInfo);
                tempInfo.setTotal(1);
                if (!site.isAlive()) {
                    tempInfo.setFailure(1);
                }
            } else {
                tempInfo.setTotal(tempInfo.getTotal() + 1);
                if (!site.isAlive()) {
                    tempInfo.setFailure(tempInfo.getFailure() + 1);
                }
            }
        }
        ArrayList<UptimeInfo> newList = new ArrayList<UptimeInfo>(infoMap.size());
        for (UptimeInfo info : infoMap.values()) {
            newList.add(info);
        }
        f.delete();
        writeInfo(f, newList);

    }

    private static final String FILENAME = "./uptime_info";

    private List<UptimeInfo> readCurrentInfo() throws IOException {
        File f = getCurrentFile();
        ArrayList<UptimeInfo> ret = new ArrayList<UptimeInfo>();
        if (f.exists()) {
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(f)));
            String line;
            UptimeInfo info;
            while ((line = br.readLine()) != null) {
                if (!line.startsWith("#")) {
                    info = new UptimeInfo();
                    StringTokenizer st = new StringTokenizer(line, "|");
                    info.setKey(st.nextToken());
                    info.setTotal(Integer.parseInt(st.nextToken()));
                    info.setFailure(Integer.parseInt(st.nextToken()));
                    ret.add(info);
                }
            }
            br.close();
        }
        return ret;
    }

    private void writeInfo(File f, List<UptimeInfo> info) throws FileNotFoundException {
        log.info("write info to file");
        PrintWriter pw = new PrintWriter(f);
        StringBuilder buf;
        for (UptimeInfo in : info) {
            buf = new StringBuilder(50);
            buf.append(in.getKey());
            buf.append("|");
            buf.append(in.getTotal());
            buf.append("|");
            buf.append(in.getFailure());
            buf.append("|");
            buf.append((1 - ((float) in.getFailure() / in.getTotal())) * 100);
            buf.append("% up time");
            pw.println(buf.toString());

        }
        pw.flush();
        pw.close();
    }

    private File getCurrentFile() throws IOException {
        File f = new File(FILENAME);
        if (!f.exists()) {
            f.createNewFile();
        }

        return f;
/*
        File[] files = new File(".").listFiles();
        int id = 0;
        int idx = -1;
        for (int i = 0; i < files.length; i++) {
            int tempId = 0;
            if (files[i].getName().startsWith(FILENAME_PREFIX)) {
                tempId = Math.max(id, Integer.parseInt(files[i].getName().substring(FILENAME_PREFIX.length())));
                if (tempId > id) {
                    id = tempId;
                    idx = i;
                }
            }
        }
        if (idx >= 0) {
            return files[idx];
        } else {
            return null;
        }
*/

    }


    private static class UptimeInfo {
        private String key;
        private int total;
        private int failure;

        public String getKey() {
            return key;
        }

        public void setKey(String key) {
            this.key = key;
        }

        public int getTotal() {
            return total;
        }

        public void setTotal(int total) {
            this.total = total;
        }

        public int getFailure() {
            return failure;
        }

        public void setFailure(int failure) {
            this.failure = failure;
        }
    }

    private void testSite(PollInfo info) throws InterruptedException, IOException {
        String[] callAndArgs4 = {"wget",
                info.getUrl(),
                "--timeout=" + info.getTimeout(),
                "-t3",
                ""};

        Process p = Runtime.getRuntime().exec(callAndArgs4);
        p.waitFor();

        String errorInfo = getData(p.getErrorStream());
        p.destroy();

        log.info(info.getUrl() + " " + errorInfo + "\n" + p.exitValue());

        if (errorInfo.indexOf("failed") != -1) {
            if (info.isAlive()) {
                log.warn("FAILED, SENDING MAIL");
                addError("connection to " + info.getSiteName() + " failed");
                addError(errorInfo);
                addShortError("connection to " + info.getSiteName() + " failed");
                info.setAlive(false);
                sendError();
            }
        } else if (errorInfo.indexOf("200 OK") == -1) {
            if (info.isAlive()) {
                log.warn("FAILED, SENDING MAIL");
                addError("response from " + info.getSiteName() + " failed");
                addError(errorInfo);
                addShortError("response from " + info.getSiteName() + " failed");
                info.setAlive(false);
                sendError();
            }
        } else {
            info.setAlive(true);
        }
        wack();


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

    private static String[] errors = {"", ""};

    public static void addError(String message) {
        log.info("ADDING ERROR");
        errors[LONG_LIST] += message + "\n";
    }

    public static void addShortError(String message) {
        log.info("ADDING SHORT ERROR");
        errors[SHORT_LIST] += message + "\n";
    }

    public void sendError() {
        String[] addresses;
        if (testing) {
            addresses = testingAddresses;
        } else {
            addresses = this.addresses;
        }
        for (int i = 0; i < errors.length; i++) {
            if (!errors[i].equals("")) {
                try {
                    TCSEmailMessage em = new TCSEmailMessage();
                    em.addToAddress(addresses[i], TCSEmailMessage.TO);
                    em.setSubject("Server Error");
                    em.setBody(errors[i]);
                    em.setFromAddress("service@topcoder.com");
                    EmailEngine.send(em);
                    errors[i] = "";
                } catch (Exception e) {
                    log.error("HERE" + e.getClass());
                    e.printStackTrace();
                }
            }
        }
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


    private final static String[] badFiles = {
            "dashboard.action", "Dashboard.jspa", "index.html", "login.jsp", "openaim", "longcontest"};

    private void wack() {
        File[] files = new File(".").listFiles();
        int i = 0;
        try {
            for (; i < files.length; i++) {
                for (String s : badFiles) { 
                    if (files[i].getName().startsWith(s)) {
                        files[i].delete();
                    }
                }
            }
        } catch (Exception e) {
            log.debug("error deleting " + files[i] + " " + e.getMessage());
        }
    }


    private static class PollInfo {
        private boolean isAlive;
        private String siteName;
        private String url;
        private int timeout;

        PollInfo(boolean isAlive, String url, String siteName, int timeout) {
            this.isAlive = isAlive;
            this.url = url;
            this.siteName = siteName;
            this.timeout = timeout;
        }


        public boolean isAlive() {
            return isAlive;
        }

        public void setAlive(boolean alive) {
            isAlive = alive;
        }

        public String getSiteName() {
            return siteName;
        }

        public void setSiteName(String siteName) {
            this.siteName = siteName;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }

        public int getTimeout() {
            return timeout;
        }

        public void setTimeout(int timeout) {
            this.timeout = timeout;
        }
    }

}
