/**
 * FilterHtml.java
 * July 25, 2000
 *
 * Copyright (C) 2000 CoolServlets.com. All rights reserved.
 *
 * ===================================================================
 * The Apache Software License, Version 1.1
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by
 *        CoolServlets.com (http://www.coolservlets.com)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Jive" and "CoolServlets.com" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please
 *    contact webmaster@coolservlets.com.
 *
 * 5. Products derived from this software may not be called "Jive",
 *    nor may "Jive" appear in their name, without prior written
 *    permission of CoolServlets.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL COOLSERVLETS.COM OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of CoolServlets.com. For more information
 * on CoolServlets.com, please see <http://www.coolservlets.com>.
 */
 
package com.coolservlets.forum.filter;

import java.util.*;
import java.io.*;

import com.coolservlets.forum.*;
import com.coolservlets.codeviewer.*;

/**
 * A ForumMessageFilter that escapes all HTML tags to prevent a user
 * from embedding arbitrary HTML in a message.
 */
public class FilterHtml extends ForumMessageFilter implements Serializable {

    private static final String OPEN_PRE = "<pre>";
    private static final String CLOSE_PRE= "</pre>";

    /**
     * Property values of the filter.
     */
    private Properties props;

    /**
     * Property descriptions of the filter.
     */
    private Properties propDescriptions;

    /**
     * Creates a new filter not associated with a message. This is
     * generally only useful for defining a template filter that other
     * fitlers will be cloned from.
     */
    public FilterHtml() {
        super();
        props = new Properties();
        propDescriptions = new Properties();
    }

    /**
     * Creates a new filter wrapped around the specified message. This
     * constructor is normally called when cloning a filter template.
     *
     * @param message the ForumMessage to wrap the new filter around.
     * @param properties the property values for the filter.
     * @param propertyDescriptions the property descriptions for the filter.
     */
    public FilterHtml(ForumMessage message, Properties props,
            Properties propDescriptions)
    {
        super(message);
        this.props = new Properties(props);
        this.propDescriptions = new Properties(propDescriptions);
    }

    /**
     * Clones a new filter that will have the same properties and that
     * will wrap around the specified message.
     *
     * @param message the ForumMessage to wrap the new filter around.
     */
    public ForumMessageFilter clone(ForumMessage message){
        return new FilterHtml(message,props,propDescriptions);
    }

    /**
     * Returns the name of the filter.
     */
    public String getName() {
        return "HTML Filter";
    }

    /**
     * Returns a description of the filter.
     */
    public String getDescription() {
        return "Escapes HTML tags by converting &lt; and &gt; characters " +
                "into HTML esacpe sequences.";
    }

    /**
     * Returns the author of the filter.
     */
    public String getAuthor() {
        return "CoolServlets.com";
    }

    /**
     * Returns the major version number of the filter.
     */
    public int getMajorVersion() {
        return 1;
    }

    /**
     * Returns a description of the filter.
     */
    public int getMinorVersion() {
        return 0;
    }

    /**
     * Returns the value of a property of the filter.
     *
     * @param name the name of the property.
     * @returns the value of the property.
     */
    public String getFilterProperty(String name) {
        return props.getProperty(name);
    }

    /**
     * Returns the description of a property of the filter.
     *
     * @param name the name of the property.
     * @return the description of the property.
     */
    public String getFilterPropertyDescription(String name) {
        return propDescriptions.getProperty(name);
    }

    /**
     * Returns an Enumeration of all the property names.
     */
    public Enumeration filterPropertyNames() {
        //No properties, so return null.
        return null;
    }

    /**
     * Sets a property of the filter. Each filter has a set number of
     * properties that are determined by the filter author.
     *
     * @param name the name of the property to set.
     * @param value the new value for the property.
     *
     * @throws IllegalArgumentException if the property trying to be set doesn't
     *    exist.
     */
    public void setFilterProperty(String name, String value)
            throws IllegalArgumentException
    {
        if (props.getProperty(name) == null) {
            throw new IllegalArgumentException();
        }
        props.put(name, value);
    }

    /**
     * <b>Overloaded</b> to return the subject of the message with HTML tags
     * escaped.
     */
    public String getSubject() {
        return escapeHTMLTags(message.getSubject());
    }

    /**
     * <b>Overloaded</b> to return the body of the message with HTML tags
     * escaped.
     */
    public String getBody() {
        return escapeHTMLTags(message.getBody());
    }

    /**
     * This method takes a string which may contain HTML tags (ie, <b>, <table>,
     * etc) and converts the '<' and '>' characters to their HTML escape
     * sequences.
     *
     * @param input The text to be converted.
     * @return The input string with the characters '<' and '>' replaced with
     *  &lt; and &gt; respectively.
     */
    private String escapeHTMLTags( String input ) {
        //Check if the string is null or zero length -- if so, return
        //what was sent in.
        if( input == null || input.length() == 0 ) {
            return input;
        }
        //Use a StringBuffer in lieu of String concatenation -- it is
        //much more efficient this way.
        StringBuffer buf = new StringBuffer(input.length()+6);
        char ch = ' ';
        for( int i=0; i<input.length(); i++ ) {
            ch = input.charAt(i);
            if( ch == '<' ) {
                if (input.substring(i, i+OPEN_PRE.length()).toLowerCase().equals(OPEN_PRE)) {
                    buf.append(OPEN_PRE);
                    i+=OPEN_PRE.length()-1;
                } else if (input.substring(i, i+CLOSE_PRE.length()).toLowerCase().equals(CLOSE_PRE)) {
                        buf.append(CLOSE_PRE);
                        i+=CLOSE_PRE.length()-1;
                } else {
                    buf.append( "&lt;" );
                }
            }
            else if( ch == '>' ) {
                if ((i>=OPEN_PRE.length()-1 && !input.substring(i-(OPEN_PRE.length()-1), i+1).toLowerCase().equals(OPEN_PRE))
                        ||
                    (i>=CLOSE_PRE.length()-1 && !input.substring(i-(CLOSE_PRE.length()-1), i+1).toLowerCase().equals(CLOSE_PRE))) {
                    buf.append( "&gt;" );
                }
            }
            else {
                buf.append( ch );
            }
        }
        return buf.toString();
    }
} 
