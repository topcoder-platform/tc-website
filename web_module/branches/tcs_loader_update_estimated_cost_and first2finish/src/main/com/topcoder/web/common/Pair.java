package com.topcoder.web.common;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Sep 26, 2007
 */
public class Pair<T,S> {
    private T a;
    private S b;

    public Pair() {

    }
    
    public Pair(T a, S b) {
        this.a = a;
        this.b = b;
    }


    public T getA() {
        return a;
    }

    public void setA(T a) {
        this.a = a;
    }

    public S getB() {
        return b;
    }

    public void setB(S b) {
        this.b = b;
    }
}
