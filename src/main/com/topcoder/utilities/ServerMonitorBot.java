/*
 * ServerMonitorBot.java
 *
 * Created on August 30, 2004, 2:03 PM
 */

package com.topcoder.utilities;

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
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.StringTokenizer;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;

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
            "dbelfer@topcoder.com", "dbelfer@topcoder.com"
    };

    private static final String OUTPUT_FILE = "./file.out";
    private final static int SHORT_LIST = 0;
    private final static int LONG_LIST = 1;
    private PollInfo[] sites;
    
    /**
     * Creates a new instance of ServerMonitorBot
     */
    public ServerMonitorBot() {
    }

    public static void main(String[] args) throws Exception {
        ServerMonitorBot client = new ServerMonitorBot();
        String configurationFile = "monitor.properties";
        if (args.length == 1) {
            configurationFile = args[0];
        }
        System.out.println("Configuring monitor using :" + configurationFile);
        client.configure(configurationFile);
        client.run();
    }

    private void configure(String configurationFile) throws FileNotFoundException, IOException {
        if ("true".equals(System.getProperty("test"))) {
            testing = true;
            log.info("Using test configuration");
        }
        Properties props = new Properties();
        FileInputStream is = new FileInputStream(configurationFile);
        try {
            props.load(is);
        } finally {
            is.close();
        }
        configure(props);
    }

    private void configure(Properties props) {
        int hostSize = Integer.parseInt(props.getProperty("hosts.count").trim());
        int defaultTimeout = Integer.parseInt(props.getProperty("default.timeout").trim());
        List<PollInfo> sitesList = new LinkedList();
        for(int i = 0; i < hostSize; i++) {
            log.info("Configuring entry "+i);
            String hostPrefix = "host."+i+".";
            String hostName = props.getProperty(hostPrefix+"name");
            String hostURL = props.getProperty(hostPrefix+"url");
            String hostTimeout = props.getProperty(hostPrefix+"timeout");
            log.info("Entry: Name=["+hostName+"] URL["+hostURL+"] Timeout["+hostTimeout+"]");
            
            if (hostName == null || hostName.trim().length() == 0 || hostURL == null || hostURL.trim().length() == 0) {
                log.info("Ignoring host entry #"+i);
                continue;
            }
            int timeout = defaultTimeout;
            if (hostTimeout == null || hostTimeout.trim().length() == 0) {
                log.info("Host timeout #"+i+" is empty. Using default ["+defaultTimeout+"]");
            } else {
                timeout = Integer.parseInt(hostTimeout.trim());
            }
            sitesList.add(new PollInfo(true, hostURL.trim(), hostName.trim(), timeout));
        }
        sites = (PollInfo[]) sitesList.toArray(new PollInfo[sitesList.size()]);
    }

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

            try {
                Thread.sleep(5 * 60 * 1000);
            } catch (InterruptedException e) {
                log.info("Interrupted...");
                break;
            } 
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
                "-O "+OUTPUT_FILE};

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

    private void wack() {
        try {
            new File(OUTPUT_FILE).delete();
        } catch (Exception e) {
            log.debug("error deleting " + OUTPUT_FILE + " " + e.getMessage());
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
