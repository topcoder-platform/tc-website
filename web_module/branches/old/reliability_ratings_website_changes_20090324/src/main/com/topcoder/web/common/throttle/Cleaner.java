package com.topcoder.web.common.throttle;

import java.util.List;
import java.util.ListIterator;
import java.util.Map;

/**
 * This class implements a cleaner thread for a throttler's activity list and map..
 *
 * @author ivern
 */
class Cleaner extends Thread {
    /**
     * Default sweep frequency, in milliseconds.
     */
    private static final int DEFAULT_SWEEP_FREQUENCY = 1000;

    /**
     * Map of User -> Number of hits in the current intervalLength.
     */
    private Map activityMap;

    /**
     * Record of all hits by all users in the current intervalLength.  This is kept as a queue,
     * with older hits near the front of the list and newer hits near the back.
     */
    private List activityList;

    /**
     * Length of an interval in milliseconds.
     */
    private int intervalLength;

    /**
     * How often the cleaner should run, in milliseconds.
     *
     * @see Cleaner#DEFAULT_SWEEP_FREQUENCY
     */
    private int sweepFrequency;

    /**
     * Determines whether the cleaner is running or not.
     */
    private boolean running;

    /**
     * Constructs an instance of Cleaner with a default sweep frequency.
     *
     * @param activityMap
     * @param activityList
     * @param intervalLength
     * @see Cleaner#DEFAULT_SWEEP_FREQUENCY
     */
    public Cleaner(Map activityMap, List activityList, int intervalLength) {
        this(activityMap, activityList, intervalLength, DEFAULT_SWEEP_FREQUENCY);
    }

    /**
     * Constructs an instance of Cleaner.
     *
     * @param activityMap
     * @param activityList
     * @param intervalLength
     * @param sweepFrequency
     */
    public Cleaner(Map activityMap, List activityList, int intervalLength, int sweepFrequency) {
        this.activityMap = activityMap;
        this.activityList = activityList;
        this.intervalLength = intervalLength;
        this.sweepFrequency = sweepFrequency;
        this.running = false;
    }

    /**
     * Stops the thread.  To restart, simply call <code>run()</code> again.
     */
    public void stopRunning() {
        this.running = false;
    }

    /**
     * Sweeps trhough the activity list, removing all hits that fell out of the current intervalLength
     * and updating their counters.  If any counters drop down to zero, they are removed from the
     * activity map.
     */
    public void run() {
        this.running = true;

        while (this.running) {
            try {
                // If we need to make the locking more fine grained, we could exploit the fact that we
                // always add elements to the back of the queue, and take them out of the front.  We could
                // then use one lock for the reader/deleter and one for the inserter.  This would however
                // require a custom list implementation, as well as handling some tricky corner cases,
                // and it doesn't seem worthwhile right now since even under heavy load (tens of thousands
                // of records), the sweeper almost always runs in less than 10 milliseconds.  The benefit
                // wouldn't really be less overall CPU usage, but rather better responsiveness.  Currently,
                // no hits can be processed while the sweeper runs.
                synchronized (this.activityList) {
                    ListIterator li = this.activityList.listIterator();
                    boolean insideInterval = true;
                    long now = System.currentTimeMillis();

                    while (li.hasNext() && insideInterval) {
                        Activity nextActivity = (Activity) li.next();

                        if (now - nextActivity.getTimeStamp() > this.intervalLength) {
                            // We technically don't need to lock the map, since all the code that changes the map
                            // is contained inside a list lock, but I guess this is the "right" thing to do since
                            // it'll keep the sequence clear if we want to change list locking later.
                            synchronized (this.activityMap) {
                                nextActivity.getCounter().decrement();

                                if (nextActivity.getCounter().getValue() <= 0) {
                                    this.activityMap.remove(nextActivity.getUserId());
                                }
                            }
                            li.remove();
                        } else {
                            // We overran the time interval, time to bail out.
                            insideInterval = false;
                        }
                    }
                }

                sleep(this.sweepFrequency);
            } catch (InterruptedException ie) {
                // TODO: Handle this properly.
                ie.printStackTrace();
                this.running = false;
            }
        }
    }
}
