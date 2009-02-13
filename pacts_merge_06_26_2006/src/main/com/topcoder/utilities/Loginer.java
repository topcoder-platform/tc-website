package com.topcoder.utilities;

import com.meterware.httpunit.*;
import com.topcoder.shared.util.logging.Logger;

import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Sep 26, 2005
 */
public class Loginer {
    private static final Logger log = Logger.getLogger(Loginer.class);

    private static Queue requestQueue = new Queue();
    private static Set visited = Collections.synchronizedSet(new HashSet());

    private static String start = "www.dev.topcoder.com";

    private static WebConversation client = new WebConversation();

    public static void main(String[] args) {
        try {
            if (args.length == 2) {
                if (args[0].equals("root")) {
/*
                    Runtime r = Runtime.getRuntime();
                    Process p = null;
                    StringBuffer buf = new StringBuffer();
*/
                    for (int i = 0; i < 20; i++) {
                        new DoItThread(handles[i]).start();
/*
                        p = r.exec("java -cp ./resources:./build/classes:./lib/jars/httpunit.jar:./lib/jars/log4j-1.2.7.jar:./lib/jars/Tidy.jar com.topcoder.utilities.Loginer notroot " + handles[i]);
                        log.info("spawn process for " + handles[i]);
                        int ch = 0;
                        while ((ch = p.getInputStream().read()) >= 0) {
                            buf.append(ch);
                        }
                        if (buf != null)
                            log.debug(buf.toString());
*/

                    }
                } else {
                    login(args[1]);
                    addRequest("http://" + start);
                    go();
                }
            } else {
                System.exit(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.exit(1);
        }
    }


    private static void login(String handle) throws Exception {
        PostMethodWebRequest request = new PostMethodWebRequest("http://" + start + "/tc");
        request.setParameter("module", "Login");
        request.setParameter("username", handle);
        request.setParameter("password", "password");
        client.sendRequest(request);

    }


    private static void addRequest(String link) {
        //log.debug("add " + link);

        if (!visited.contains(link)
                && link.startsWith("http://" + start)) {
            if (requestQueue.size() < 10000000 && !requestQueue.contains(link)) {
                requestQueue.add(link);
            }
        }
    }

    private static WebRequest popRequest() {
        WebRequest o = null;
        if (!requestQueue.isEmpty()) {
            String s = (String) requestQueue.pop();
            //log.debug("pop " + s);
            o = new GetMethodWebRequest(s);
        }
        return o;
    }


    private static class StatusThread extends Thread {
        public void run() {
            while (true) {

                log.info(visited.size() + " processed " + requestQueue.size() +
                        " requests to process");

                try {
                    Thread.sleep(30 * 1000);
                } catch (InterruptedException e) {

                }
            }
        }
    }

    private static class DoItThread extends Thread {
        private String handle = null;

        DoItThread(String handle) {
            this.handle = handle;
        }

        public void run() {
            try {
                Runtime r = Runtime.getRuntime();
                Process p = null;
                StringBuffer buf = new StringBuffer();
                p = r.exec("java -cp ./resources:./build/classes:./lib/jars/httpunit.jar:./lib/jars/log4j-1.2.7.jar:./lib/jars/Tidy.jar com.topcoder.utilities.Loginer notroot " + handle);
                log.info("spawn process for " + handle);
                int ch = 0;
                while ((ch = p.getInputStream().read()) >= 0) {
                    buf.append(ch);
                }
                if (buf != null)
                    log.debug(buf.toString());
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }


    private static void go() {
        WebRequest curr = null;
        while (requestQueue.size() > 0) {
            try {
                curr = popRequest();
                if (curr != null) {
                    try {
                        WebResponse resp = null;
                        resp = client.sendRequest(curr);
                        if (resp.getContentType().equals("text/html")) {
                            WebLink[] pageLinks = resp.getLinks();
                            for (int i = 0; i < pageLinks.length; i++) {
                                addRequest(pageLinks[i].getRequest().getURL().toString());
                            }
                            pageLinks = null;
                        }
                        if (!visited.contains(curr.getURL().toString())) {
                            visited.add(curr.getURL().toString());
                        } else {
                            //log.debug("skip " + curr.getURL().toString());
                        }
                    } catch (HttpException e) {
                        log.error(curr.getURL() + " failed with " + e.getResponseCode());
                    }
                }
            } catch (Exception e) {
                if (curr != null) log.error(curr.toString());
                e.printStackTrace();
            }
            curr = null;
        }

    }


    private static class Queue {
        private final LinkedList q = new LinkedList();

        public synchronized boolean add(Object o) {
            return q.add(o);
        }

        public synchronized int size() {
            return q.size();
        }

        public synchronized boolean isEmpty() {
            return q.isEmpty();
        }

        public synchronized Object pop() {
            return q.removeLast();
        }

        public synchronized boolean contains(Object o) {
            return q.contains(o);
        }


    }


    private static final String[] handles = {"patent",
            "TBaer",
            "MBucken",
            "nvidia3",
            "verizon5",
            "intuit2",
            "intuit3",
            "synopsys1",
            "synopsys2",
            "synopsys3",
            "motorola3",
            "klat1",
            "klat2",
            "klat3",
            "EScannell",
            "TSullivan",
            "CBabcock",
            "ANewman",
            "RWilliamson",
            "JFarrell",
            "KBannan",
            "JHill",
            "gfw",
            "MWagner",
            "borland1",
            "old_system",
            "borland2",
            "borland3",
            "borland4",
            "oracle",
            "tccc_spectator1",
            "guest265",
            "guest266",
            "guest267",
            "guest268",
            "guest269",
            "guest270",
            "guest271",
            "demo01",
            "demo02",
            "demo03",
            "demo04",
            "demo05",
            "demo06",
            "demo07",
            "demo08",
            "demo09",
            "demo10",
            "demo11",
            "demo12",
            "demo13",
            "demo14",
            "demo15",
            "demo16",
            "demo17",
            "demo18",
            "demo19",
            "demo20",
            "guest295",
            "guest296",
            "Tick",
            "mitalub",
            "ybao",
            "killingspeed2",
            "igorparsadanov",
            "Steven",
            "red",
            "busabusa",
            "cdanek",
            "nomad",
            "Teardad",
            "weasal",
            "ikushkiev",
            "urza",
            "jsmabasa",
            "piotrek81",
            "splag",
            "sleastak",
            "vortix",
            "Seether",
            "marmaros",
            "luqin",
            "iknelev",
            "etkacz",
            "magar",
            "betaalpha",
            "stiegld",
            "hchaser",
            "mark1979",
            "StanfordMike",
            "Squall",
            "jbrandon",
            "GraciMae",
            "arunpradeep",
            "nuco_asdf",
            "Seal_Team_Six",
            "barrym187",
            "dpuza",
            "aeontrek",
            "Dodger",
            "sureshkg",
            "qubits",
            "Blue_Dude",
            "hrathi",
            "Jon4isu",
            "root2600",
            "kellymi",
            "zebaroo",
            "keeG repuS",
            "endoplaz",
            "dsongman",
            "rumil",
            "justinw",
            "tistle",
            "jatt_sandhu",
            "serialno23",
            "alpha",
            "wvernon",
            "marcoscarlos",
            "eattrig",
            "zonebit",
            "ShadowFlash",
            "Charlie",
            "uler3161",
            "jwyse",
            "edwardt",
            "Tom Bombadil",
            "uwneal",
            "jay_peg",
            "Kelsen",
            "GrimPilgrim",
            "seratonin",
            "sjelkjd",
            "jhass",
            "afortier",
            "pmartini",
            "Phantom Coder",
            "fireball",
            "jalibr",
            "mathgodleo",
            "paradox",
            "Code-Guru",
            "ergundee",
            "Cougar",
            "madoc",
            "Lefty",
            "dpecora",
            "beghbali",
            "svoukidi",
            "freshStart",
            "JeromeBridge",
            "kackman",
            "wallenfe",
            "bonehead",
            "JeffMulder",
            "blackhalo",
            "mpauker",
            "jbethencourt",
            "burfoot",
            "patsup",
            "junk",
            "UMdrone",
            "pgerzani",
            "harriervi",
            "rosnfeld",
            "empraptor",
            "Ascription",
            "dalzg",
            "falcon",
            "Poly5",
            "vulture",
            "taher",
            "eallen",
            "guruthrill",
            "ARexey",
            "Soli",
            "dedomena",
            "zhanghan12",
            "laprej",
            "tyrithe",
            "Orbus",
            "filip",
            "Brunskole",
            "ggranum",
            "Spenc4hir",
            "g888",
            "pbrooks",
            "DeVoT3DGrL",
            "JonnyKill",
            "truonghung99",
            "dystraxion",
            "Wistil",
            "bm999",
            "chrismorris",
            "ColinMacLeod",
            "tourette",
            "chiachenou",
            "dminn",
            "Spam_vt",
            "huntergt"};


}
