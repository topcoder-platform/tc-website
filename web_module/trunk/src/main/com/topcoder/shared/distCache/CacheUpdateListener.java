package com.topcoder.shared.distCache;

public interface CacheUpdateListener
{
    public void valueUpdated(CachedValue value);
    public void clear();
}
