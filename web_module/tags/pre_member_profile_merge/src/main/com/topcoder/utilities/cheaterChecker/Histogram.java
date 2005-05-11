package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.logging.Logger;

import java.util.*;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 24, 2005
 */
public class Histogram {

    private static Logger log = Logger.getLogger(Histogram.class);
    private HashMap histogram = null;

    public Histogram() {
        histogram = new HashMap();
    }

    public Histogram(List l) {
        this();
        for (Iterator it = l.iterator(); it.hasNext();) {
            add(it.next());
        }
    }

    public void add(Object o) {
        Integer count = null;
        if (histogram.containsKey(o)) {
            log.debug("found " + o);
            count = (Integer) histogram.get(o);
            histogram.put(o, new Integer(count.intValue() + 1));
        } else {
            log.debug("not found " + o);
            histogram.put(o, new Integer(1));
        }
    }

    public SortedSet getSortedSet() {
        Comparator histogramComparator = new Comparator() {
            public int compare(Object o1, Object o2) {
                return ((Integer) ((Map.Entry) o2).getValue()).compareTo(((Integer) ((Map.Entry) o1).getValue()));
            }
        };
        TreeSet s = new TreeSet(histogramComparator);
        for (Iterator it = histogram.entrySet().iterator(); it.hasNext();) {
            s.add(it.next());
        }
        return s;
    }


}
