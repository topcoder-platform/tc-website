package com.topcoder.utilities;

import com.meterware.httpunit.*;
import com.topcoder.shared.util.logging.Logger;

import java.util.LinkedList;
import java.util.HashSet;
import java.util.Set;
import java.util.Collections;


/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Mar 3, 2005
 */
public class SiteCrawler {
    private static final Logger log = Logger.getLogger(SiteCrawler.class);
    private static Queue requestQueue = new Queue();
    private static Set visited = Collections.synchronizedSet(new HashSet());

    private static String start = "www.topcoder.com";

    private static final int THREAD_COUNT = 1;
    private static WebConversation client = new WebConversation();

    public static void main(String[] args) {
        if (args.length == 1) {
            start = args[0];
        }

        addRequest("http://"+start);

        new StatusThread().start();

        for (int i = 0; i < THREAD_COUNT; i++) {
            new RequestProcessor().start();
        }
    }

    private static void addRequest(String link) {
        //log.debug("add " + link);

        if (!visited.contains(link)
                && link.startsWith("http://"+start)) {
            synchronized(requestQueue) {
                while (true) {
                    if (requestQueue.size()<10000000&&!requestQueue.contains(link)) {
                        requestQueue.add(link);
                        break;
                    } else {
                        try {
                            requestQueue.wait();
                        } catch (InterruptedException e) {

                        }
                    }
                }
            }
        }
    }

    private static WebRequest popRequest() {
        WebRequest o = null;
        synchronized(requestQueue) {
            if (!requestQueue.isEmpty()) {
                String s = (String)requestQueue.pop();
                //log.debug("pop " + s);
                o = new GetMethodWebRequest(s);
                requestQueue.notifyAll();
            }
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


    private static class RequestProcessor extends Thread {
        public void run() {
            WebRequest curr = null;
            while (!interrupted()) {
                try {
                    curr = popRequest();
                    if (curr != null) {
                        try {
                            WebResponse resp = null;
                            synchronized(client) {
                                resp = client.sendRequest(curr);
                            }
                            if (resp.getContentType().equals("text/html")) {
                                WebLink[] pageLinks = resp.getLinks();
                                for (int i = 0; i < pageLinks.length; i++) {
                                    addRequest(pageLinks[i].getRequest().getURL().toString());
                                }
                                pageLinks = null;
                            }
                            synchronized (visited) {
                                if (!visited.contains(curr.getURL().toString())) {
                                    visited.add(curr.getURL().toString());
                                } else {
                                    //log.debug("skip " + curr.getURL().toString());
                                }
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


}
