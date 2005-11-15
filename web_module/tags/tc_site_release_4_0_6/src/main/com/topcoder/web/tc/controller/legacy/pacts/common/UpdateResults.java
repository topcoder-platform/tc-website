/******************************************************************************\
 *
 * File:          UpdateResults.java
 * Creation date: March 05, 2002 10:19
 * Author:        Matt Murphy
 * Purpose:       Store most common information requested about an affidavit
 * See:           PactsServicesBean.java
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.common;

import com.topcoder.shared.util.logging.Logger;

import java.util.*;

public class UpdateResults implements Map, java.io.Serializable {

    private static Logger log = Logger.getLogger(UpdateResults.class);

    private static final String STRING_CLOSER = ".";
    private static final String ERROR = "Error";

    private class NoException extends Exception {
    }

    private Map m_results;
    private int m_status_id;
    private String m_status_desc;

//
// Supported Constructors
//


    private UpdateResults() {
        m_results = new HashMap();
        m_status_id = -1;
        m_status_desc = null;
    }


    public UpdateResults(int status_id) {
        this(status_id, null);
    }


    public UpdateResults(int status_id, String status_desc) {
        m_results = new HashMap();
        m_status_id = status_id;
        m_status_desc = status_desc;
    }


    public UpdateResults(long[] ids) {
        m_results = new HashMap();
        m_status_id = -1;
        m_status_desc = null;
        for (int n = 0; n < ids.length; n++) put(new String().valueOf(ids[n]), new NoException());
    }


    public UpdateResults(String[] ids) {
        m_results = new HashMap();
        m_status_id = -1;
        m_status_desc = null;
        for (int n = 0; n < ids.length; n++) put(ids[n], new NoException());
    }


    public UpdateResults(long[] ids, int status_id) {
        this(ids, status_id, null);
    }


    public UpdateResults(long[] ids, int status_id, String status_desc) {
        m_results = new HashMap();
        m_status_id = status_id;
        m_status_desc = status_desc;
        for (int n = 0; n < ids.length; n++) put(new String().valueOf(ids[n]), new NoException());
    }


    public UpdateResults(String[] ids, int status_id) {
        this(ids, status_id, null);
    }


    public UpdateResults(String[] ids, int status_id, String status_desc) {
        m_results = new HashMap();
        m_status_id = status_id;
        m_status_desc = status_desc;
        for (int n = 0; n < ids.length; n++) put(ids[n], new NoException());
    }



//
// Encapsulation Funtions
//


    public int getStatusId() {
        return m_status_id;
    }


    public String getStatusDesc() {
        if (m_status_desc == null)
            return "";
        else
            return m_status_desc;
    }


    public Map getResults() {
        return m_results;
    }


    public int setStatusId(int status_id) {
        int old = m_status_id;
        m_status_id = status_id;
        return old;
    }


    public String setStatusDesc(String status_desc) {
        String old = m_status_desc;
        m_status_desc = status_desc;
        return old;
    }


//
// Supported Map Functions
//


    public String put(String id, Exception e) {
        String old = get(id);
        m_results.put(id, e);
        return old;
    }


    public String put(long id, Exception e) {
        return put(new String().valueOf(id), e);
    }

    public void clear() {
        m_results.clear();
    }


    public String get(long id) {
        return get(new String().valueOf(id));
    }


    public String get(String id) {
        Exception e = (Exception) m_results.get(id);
        if (e == null) return null;
        String rv;
        if (e instanceof NoException) {
            if (m_status_id < 0)
                rv = "Payment number " + id + " was reviewed";
            else {
                rv = "Payment number " + id + " updated to status of ";
                if (m_status_desc == null)
                    rv += new String().valueOf(m_status_id);
                else
                    rv += m_status_desc;
            }
        } else {
            StringTokenizer t = new StringTokenizer(e.toString(), "\n");
            rv = "Payment number " + id + " generated error: ";
            String err = ERROR;
            try {
                while (t.hasMoreElements()) err = (String) t.nextElement();
            } catch (Exception ignored) {
            }
            rv += err;
        }
        return rv += STRING_CLOSER;
    }


    public int size() {
        return m_results.size();
    }


    public boolean isEmpty() {
        return m_results.isEmpty();
    }


    public boolean containsKey(Object k) {
        return m_results.containsKey(k);
    }


    public boolean containsValue(Object v) {
        return m_results.containsValue(v);
    }


    public int hashCode() {
        return m_results.hashCode();
    }


    public boolean equals(Object o) {
        if (o instanceof UpdateResults &&
                m_status_id == ((UpdateResults) o).getStatusId() &&
                m_status_desc.equals(((UpdateResults) o).getStatusDesc()) &&
                m_results.equals(((UpdateResults) o).getResults()))
            return true;
        else
            return false;
    }


//
// Unsupported Map Functions
//


    public Object put(Object k, Object v) throws UnsupportedOperationException {
        throw new UnsupportedOperationException();
    }

    public Object get(Object k) throws UnsupportedOperationException {
        throw new UnsupportedOperationException();
    }

    public Object remove(Object o) throws UnsupportedOperationException {
        throw new UnsupportedOperationException();
    }

    public void putAll(Map m) throws UnsupportedOperationException {
        throw new UnsupportedOperationException();
    }


//
// Misc Map Functions
//


    public Collection values() {
        return m_results.values();
    }


    public Set keySet() {
        return m_results.keySet();
    }


    public Set entrySet() {
        return m_results.entrySet();
    }

}


