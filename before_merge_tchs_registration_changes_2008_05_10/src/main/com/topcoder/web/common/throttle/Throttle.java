package com.topcoder.web.common.throttle;
/*
 * Throttle.java
 *
 * Created on March 28, 2006, 8:48 AM
 */


import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Implements a throttling mechanism designed to limit the frequency at which users can access
 * a website.
 *
 * @author ivern
 */
public class Throttle {
    /**
     * Map of User -> Number of hits in the current interval.
     */
    private Map activityMap;

    /**
     * Record of all hits by all users in the current interval.  This is kept as a queue,
     * with older hits near the front of the list and newer hits near the back.
     */
    private List activityList;

    /**
     * Reference to the cleaner thread instance for this throttler.
     */
    private Cleaner cleanerThread;

    /**
     * Maximum number of hits a user can do within an interval before they start getting
     * throttled.
     */
    private int maxHits;

    /**
     * Length of an interval in milliseconds.
     */
    private int interval;

    /**
     * Constructs a new Throttle instance using a HashMap for the activity map, and a
     * LinkedList for the activity list.
     *
     * @param maxHits  Maximum number of hits allowed per user per interval.
     * @param interval Length of an interval in milliseconds.
     */
    public Throttle(int maxHits, int interval) {
        this(new HashMap(), new LinkedList(), maxHits, interval);
    }

    /**
     * Constructs a new Throttle instance.
     *
     * @param activityMap  a Map to hold the user -> counter relation.
     * @param activityList a List to hold the activity queue.
     * @param maxHits      Maximum number of hits allowed per user per interval.
     * @param interval     Length of an interval in milliseconds.
     */
    public Throttle(Map activityMap, List activityList, int maxHits, int interval) {
        this.activityMap = activityMap;
        this.activityList = activityList;
        this.maxHits = maxHits;
        this.interval = interval;

        this.cleanerThread = new Cleaner(activityMap, activityList, interval);
        this.cleanerThread.start();
    }

    /**
     * Helper method that lets you throttle by path as well as user Id.  This method
     * should be called for every user request, and it will return  <code>true</code>
     * if the request should be throttled.
     * <p/>
     * Using this method extends the activity map's space needs to the sum across all
     * users of the number of paths they accessed.  This has the potential to be as large
     * as the cartesian product of the user set and the path set, but thankfully that is
     * extremely unlikely to happen in reality.  The activity list's space complexity
     * remains linear in terms of the number of requests.
     *
     * @param userId A string that uniquely identifies the user.
     * @param path   A string that uniquely identifies the path.
     * @return <code>true</code> if the user should be throttled, <code>false</code> otherwise.
     */
    public boolean throttle(String userId, String path) {
        return throttle(userId + "@" + path);
    }

    /**
     * Main throttler method.  This method should be called for every user request, and it will return
     * <code>true</code> if the request should be throttled.
     * <p/>
     * Using this method causes the activity map's space needs to be linear in terms of the number of
     * users, and the activity list's space needs to be linear in terms of the number of requests.
     *
     * @param userId A string that uniquely identifies the user.
     * @return <code>true</code> if the user should be throttled, <code>false</code> otherwise.
     */
    public boolean throttle(String userId) {
        Counter userCounter = null;

        // We have to lock in this order to avoid a deadlock with the cleaner thread.
        synchronized (this.activityList) {
            // We technically don't need to lock the map, since all the code that changes the map
            // is contained inside a list lock, but I guess this is the "right" thing to do since
            // it'll keep the sequence clear if we want to change list locking later.
            synchronized (this.activityMap) {
                if (this.activityMap.containsKey(userId)) {
                    userCounter = (Counter) this.activityMap.get(userId);
                    userCounter.increment();
                } else {
                    this.activityMap.put(userId, userCounter = new Counter(1));
                }
            }

            this.activityList.add(new Activity(userId, System.currentTimeMillis(), userCounter));
        }

        return userCounter.getValue() > this.maxHits;
    }

    /**
     * Clears the throttler, resetting both the activity map and the activity list.
     */
    public void clear() {
        synchronized (this.activityList) {
            synchronized (this.activityMap) {
                this.activityMap.clear();
            }

            this.activityList.clear();
        }
    }

    /**
     * Stops the throttler's cleaner thread.
     */
    public void stopCleaner() {
        this.cleanerThread.stopRunning();
    }
}
