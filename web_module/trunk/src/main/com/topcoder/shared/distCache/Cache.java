package com.topcoder.shared.distCache;

import java.io.Serializable;
import java.util.*;

/**
 * @author orb
 * @version  $Revision$
 */
public class Cache
        implements Serializable {
    static final int DEFAULT_PRIORITY = 5;

    Object _lock = new Integer(0); // can't serialize Object :)
    TreeMap _keymap = new TreeMap();
    TreeSet _timeset = new TreeSet(new CachedValue.TimeComparator());
    TreeSet _prioset = new TreeSet(new CachedValue.PriorityComparator());

    int _max = -1;

    Object _locklistlock = new Integer(1);

    /** not serialized */
    transient TreeSet _locklist = new TreeSet();

    /** not serialized */
    transient CacheUpdateListener _listener = null;

    /**
     *
     */
    public Cache() {
        this(-1);
    }

    /**
     *
     * @param max
     */
    public Cache(int max) {
        _max = max;
    }

    /**
     *  query the number of items in the cache
     * @return
     */
    public int size() {
        synchronized (_lock) {
            return _keymap.size();
        }
    }

    /**
     *  set a cached value
     * @param key
     * @param value
     * @param expire
     */
    public void update(String key, Object value, long expire) {
        update(key, value, DEFAULT_PRIORITY, System.currentTimeMillis(), expire);
    }

    /**
     *
     * @param key
     */
    public void lock(String key) {
        synchronized (_locklistlock) {
            System.out.println("WANT LOCK: " + key);
            if (_locklist == null) {
                _locklist = new TreeSet();
            }

            while (_locklist.contains(key)) {
                try {
                    _locklistlock.wait();
                } catch (InterruptedException e) {
                }
            }

            _locklist.add(key);
            System.out.println("GOT LOCK: " + key);
        }
    }

    /**
     *
     * @param key
     */
    public void releaseLock(String key) {
        synchronized (_locklistlock) {
            if (_locklist == null) {
                _locklist = new TreeSet();
            }

            _locklist.remove(key);
            _locklistlock.notifyAll();
            System.out.println("UNLOCK: " + key);
        }
    }


    /**
     *  set a cached value
     * @param key
     * @param value
     * @param priority
     * @param time
     * @param expire
     */
    public void update(String key, Object value, int priority, long time, long expire) {
        CachedValue cached = null;

        synchronized (_lock) {
            if (value == null) {
                cached = remove(key);
            } else {
                cached = findKey(key);
                if (cached != null) {
                    removeTime(cached);
                    removePrio(cached);
                    cached.setValue(value);
                } else {
                    cached = new CachedValue(key, value, expire);
                    storeKey(cached);
                }

                cached.setPriority(priority);
                cached.setLastUsed(time);
                cached.bumpVersion();

                addTime(cached);
                addPrio(cached);

                // maybe purge first to ensure the last op is not wasted?
                if (_max > 0) {
                    purgeInternal(_max);
                }
            }
        }


        sendUpdateEvent(cached);
    }


    /**
     *
     * @param key
     * @return
     */
    CachedValue remove(String key) {
        CachedValue cached = findKey(key);
        if (cached != null) {
            removeCached(cached);
            sendUpdateEvent(cached);
        }

        return cached;
    }

    /**
     *
     * @param cached
     */
    void removeCached(CachedValue cached) {
        removePrio(cached);
        removeTime(cached);
        removeKey(cached.getKey());
        cached.setValue(null);
    }

    /**
     *
     */
    public void clearCache() {
        clear();
        sendClearEvent();
    }

    /**
     *
     */
    void clear() {
        System.out.println("CLEARING");
        _keymap = new TreeMap();
        _timeset = new TreeSet(new CachedValue.TimeComparator());
        _prioset = new TreeSet(new CachedValue.PriorityComparator());
    }

    /**
     *  check if a key is in the cached
     * @param key
     * @return
     */
    public boolean exists(String key) {
        boolean exists = false;

        synchronized (_lock) {
            if (findKey(key) != null) {
                exists = true;
            }
        }

        return exists;
    }

    /**
     *  lookup a cached value
     * @param key
     * @return
     */
    public Object get(String key) {
        Object retval = null;

        synchronized (_lock) {
            CachedValue cached = findKey(key);
            if (cached != null) {
                retval = cached.getValue();
            }
        }

        return retval;
    }


    /**
     *  check the version number associated with a key item
     * @param key
     * @return
     */
    public int getVersion(String key) {
        int version = -1;

        synchronized (_lock) {
            CachedValue cached = findKey(key);
            if (cached != null) {
                version = cached.getVersion();
            }
        }

        return version;
    }

    /**
     *  expire items in the cache whose expiration is before or
     *  on the given expiration time
     * @param time
     */
    public void expire(long time) {
        synchronized (_lock) {
            while (true) {
                if (_timeset.isEmpty()) {
                    break;
                }

                CachedValue value = (CachedValue) _timeset.first();
                System.out.println(value.getKey() + " - " + new Date(value.getExpireTime()));
                if (value.getExpireTime() > time) {
                    break;
                }

                removeCached(value);
            }
        }

    }

    /**
     *  purge least relevant items in cache to make cache size
     *  <= the given size
     * @param size
     */
    public void purge(int size) {
        synchronized (_lock) {
            purgeInternal(size);
        }
    }

    /**
     *
     * @param size
     */
    void purgeInternal(int size) {
        while (_prioset.size() > size) {
            CachedValue value = (CachedValue) _prioset.first();
            removeCached(value);
        }
    }

    /**
     *  integrate changed items into the local cache
     * @param values
     */
    public void integrateChanges(CachedValue[] values) {
        System.out.println("TO INTEGRATE: " + values.length);
        synchronized (_lock) {
            for (int i = 0; i < values.length; i++) {
                CachedValue val = values[i];
                CachedValue current = null;

                // System.out.println("* " + val.getKey() + "=" + val.getValue());

                int presize = size();
                if (val.getValue() == null) {
                    System.out.println("REMOVE: " + val.getKey());
                    removeCached(val);
                } else {
                    current = findKey(val.getKey());
                    if (current != null) {
                        // in reality - check version
                        removeTime(current);
                        removePrio(current);
                    }

                    storeKey(val);
                    addTime(val);
                    addPrio(val);
                }

                int postsize = size();

                if (postsize - presize != 1) {
                    System.out.println("pre=" + presize + " post=" + postsize);
                    System.out.println("new= " + val.getKey() + " current=" +
                            ((current == null) ?
                            "null" : current.getKey()));
                }
            }

            if (_max > 0) {
                purgeInternal(_max);
            }
        }

    }


    // --------------------------------------------------
    // listner event operations

    /**
     *
     * @param listener
     */
    public void setUpdateListener(CacheUpdateListener listener) {
        _listener = listener;
    }


    void sendUpdateEvent(CachedValue value) {
        if ((value == null) || (_listener == null)) {
            return;
        }

        _listener.valueUpdated(value);
    }

    void sendClearEvent() {
        if (_listener == null) {
            return;
        }

        _listener.clear();
    }

    // --------------------------------------------------
    // key map operations

    /**
     *  find a CachedValue in the key map
     * @param key
     * @return
     */
    CachedValue findKey(String key) {
        return (CachedValue) _keymap.get(key);
    }


    /**
     *  remove a value from the key map
     * @param key
     */
    void removeKey(String key) {
        _keymap.remove(key);
    }


    /**
     *  store a CachedValue in the key map
     * @param value
     */
    void storeKey(CachedValue value) {
        _keymap.put(value.getKey(), value);
    }


    // --------------------------------------------------
    // timemap operations

    /**
     *
     * @param cached
     */
    void removeTime(CachedValue cached) {
        _timeset.remove(cached);
    }

    /**
     *
     * @param cached
     */
    void addTime(CachedValue cached) {
        _timeset.add(cached);
    }

    // --------------------------------------------------
    // priomap operations

    /**
     *
     * @param cached
     */
    void removePrio(CachedValue cached) {
        _prioset.remove(cached);
    }

    /**
     *
     * @param cached
     */
    void addPrio(CachedValue cached) {
        _prioset.add(cached);
    }

    /**
     *
     * @return
     */
    public ArrayList getValues() {
        ArrayList al = new ArrayList();

        Iterator it = _keymap.values().iterator();
        while (it.hasNext()) al.add(it.next());
        return al;
    }
}
