package com.topcoder.shared.util;

import java.util.LinkedList;

public final class Queue {

    private final LinkedList list=new LinkedList();

    public synchronized boolean add(Object o) {
        boolean changed=list.add(o);
        notifyAll();
        return changed;
    }

    public synchronized Object dequeue() throws InterruptedException {
        while (list.size()<=0) {
            wait();
        }
        return list.removeFirst();
    }

}
