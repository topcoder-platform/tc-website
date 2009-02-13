/*
 * Document.java
 * 26 August 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.catalog;

import java.io.Serializable;


/**
 * An object that represents a component document. Instances of this class can
 * either be created by the component catalog to return information to the
 * client, or by the client to pass information to the component catalog. In the
 * former case, the instance will contain information about the document's
 * primary key in the database. In the latter case, the instance will have a
 * dummy id of -1.
 *
 * @version 1.0, 26 August 2002
 * @author  Albert Mao
 * @see     ComponentManager
 */
public class Document implements Serializable {


    /** The status constant used to indicate a component specification document */
    public static final long COMPONENT_SPECIFICATION = 1L;

    /** The status constant used to indicate a use case diagram */
    public static final long USE_CASE_DIAGRAM = 2L;

    /** The status constant used to indicate a class diagram */
    public static final long CLASS_DIAGRAM = 3L;

    /** The status constant used to indicate a QA test plan document */
    public static final long QA_TEST_PLAN = 4L;

    /** The status constant used to indicate a deployment plan document */
    public static final long DEPLOYMENT_PLAN = 5L;

    /** The status constant used to indicate other or miscellaneous documents */
    public static final long OTHER = 6L;

    /** The status constant used to indicate a specification forum document */
    //public static final long SPECIFICATION_FORUM_DOC = 7L;  //Deprecated

    /** The status constant used to indicate a screen shot image */
    public static final long SCREEN_SHOT = 8L;

    /** The status constant used to indicate a screen shot image thumbnail */
    public static final long SCREEN_SHOT_THUMBNAIL = 9L;

    public static final long JAVADOCS = 23L;

    private long id;
    private String name;
    private String url;
    private long type;


    Document(long id, String name, String url, long type) {
        this(name, url, type);
        this.id = id;
    }

    /**
     * Constructs a new <code>Document</code> object.
     *
     * @param name the name of the document
     * @param url the URL the document can be accessed at
     * @param type the type of the document
     * @throws IllegalArgumentException if <code>name</code> or
     * <code>url</code>are <code>null</code>, or if <code>type</code> is not a
     * valid document type
     */
    public Document(String name, String url, long type) {
        if (name == null) {
            throw new IllegalArgumentException(
                    "Null specified for document name");
        }
        if (url == null) {
            throw new IllegalArgumentException(
                    "Null specified for document URL");
        }
        if (type < 0) {
            throw new IllegalArgumentException(
                    "Negative number specified for document type");
        }
        this.id = -1;
        this.name = name;
        this.url = url;
        this.type = type;
    }

    /**
     * Returns the primary key of this component document.
     *
     * @return the primary key of this document, or -1 if this document was
     * constructed by the client (instead of returned by the component catalog)
     */
    public long getId() {
        return id;
    }

    /**
     * Returns the name of this component document.
     *
     * @return the name of this document
     */
    public String getName() {
        return name;
    }

    /** Sets the name of this component document.
     *
     * @param name the new name
     * @throws IllegalArgumentException if <code>name</code> is
     * <code>null</code>
     */
    public void setName(String name) {
        if (name == null) {
            throw new IllegalArgumentException(
                    "Null specified for document name");
        }
        this.name = name;
    }

    /**
     * Returns the URL this document can be accessed at.
     *
     * @return the URL this document can be accessed at
     */
    public String getURL() {
        return url;
    }

    /**
     * Sets the URL this component document can be accessed at.
     *
     * @param url the new URL
     * @throws IllegalArgumentException if <code>url</code> is
     * <code>null</code>
     */
    public void setURL(String url) {
        if (url == null) {
            throw new IllegalArgumentException(
                    "Null specified for document URL");
        }
        this.url = url;
    }

    /**
     * Returns the type of this component document.
     *
     * @return the type of this document
     */
    public long getType() {
        return type;
    }

    /**
     * Sets the type of this component document
     *
     * @param type the new type
     * @throws IllegalArgumentException if <code>type</code> is not a valid
     * document type
     */
    public void setType(long type) {
        if (type < 0) {
            throw new IllegalArgumentException(
                    "Negative number specified for type");
        }
        this.type = type;
    }

    /**
     * Compares the specified object with this document for equality. Two
     * documents are considered equal if they have the same name and
     * URL. The primary key is <em>not</em> tested for equality.
     *
     * @param object the object to be tested for equality
     * @return <code>true</code> if the specified object is equal to this
     * document; <code>false</code> otherwise
     */
    public boolean equals(Object object) {
        if (object == null || object.getClass() != getClass()) {
            return false;
        }
        Document other = (Document) object;
        return getName().equals(other.getName())
                && getURL().equals(other.getURL());
    }

    /**
     * Returns the hash code value for this document. The hash code is
     * generated by performing a bitwise exclusive-or operation on the hash
     * codes of the <code>String</code> object containing the name and the
     * <code>URL</code> object containing this document's URL.
     *
     * @return the hash code value for this document
     */
    public int hashCode() {
        return getName().hashCode() ^ getURL().hashCode();
    }

    public String toString() {
        return "Document " + getId() + " - " + getName()
                + " (" + getURL() + ")";
    }


}