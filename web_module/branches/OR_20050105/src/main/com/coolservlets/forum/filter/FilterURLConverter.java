/**
 * FilterURLConverter.java
 * August 12, 2000
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

import com.coolservlets.forum.*;
import java.util.*;

/**
 * A ForumMessageFilter that converts URL's to working HTML web links.
 */
public class FilterURLConverter extends ForumMessageFilter {

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
    public FilterURLConverter() {
        super();
        props = new Properties();
        propDescriptions = new Properties();
        initializeProperties();
    }

    /**
     * Creates a new filter wrapped around the specified message. This
     * constructor is normally called when cloning a filter template.
     *
     * @param message the ForumMessage to wrap the new filter around.
     * @param properties the property values for the filter.
     * @param propertyDescriptions the property descriptions for the filter.
     */
    public FilterURLConverter(ForumMessage message, Properties properties,
            Properties propertyDescriptions)
    {
        super(message);
        this.props = new Properties(properties);
        this.propDescriptions = new Properties(propertyDescriptions);
    }

    /**
     * Clones a new filter that will have the same properties and that
     * will wrap around the specified message.
     *
     * @param message the ForumMessage to wrap the new filter around.
     */
    public ForumMessageFilter clone(ForumMessage message){
        return new FilterURLConverter(message, props, propDescriptions);
    }

    /**
     * Returns the name of the filter.
     */
    public String getName() {
        return "URL Converter";
    }

    /**
     * Returns a description of the filter.
     */
    public String getDescription() {
        return "Converts URL's to working web links.";
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
     * Returns the minor version number of the filter.
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
        return props.propertyNames();
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
     * <b>Overloaded</b> to return the body of message with URLs changed
     * to working links.
     */
    public String getBody() {
        return convertURL(message.getBody());
    }

    /**
     * Creates properties and sets their descriptions.
     */
    private void initializeProperties() {
    }

    /**
     * This method takes a string which may contain URLs
     * and replaces them with working links.  It does this
     * by adding the html tags <a href> and </a>.
     *
     * @param input the text to be converted.
     * @returns the input string with the URLs replaced with links.
     */
    private String convertURL( String input ) {
        //Check if the string is null or zero length -- if so, return
        //what was sent in.
        if( input == null || input.length() == 0 ) {
            return input;
        }
        else {
            StringBuffer buf = new StringBuffer();
            
            int i = 0, j = 0, oldend = 0;
            int len = input.length();
            char cur;

            while ( ( i=input.indexOf( "http://", oldend) ) >= 0 ) {
                j=i+7;
                cur = input.charAt(j);
                while (j < len) {
                    //Is a space?
                    if (cur == ' ') break;
                    //Is a Win32 newline?
                    if (cur == '\n') break;
                    //Is Unix newline?
                    if (cur == '\r' && j<len-1 && input.charAt(j+1) == '\n')
                        break;

                    j++;
                    if (j<len) {
                        cur = input.charAt(j);
                    }
                }
                buf.append(input.substring(oldend,i));
                buf.append("<a href =\"");
                buf.append(input.substring(i,j));
                buf.append("\">");
                buf.append(input.substring(i,j));
                buf.append("</a>");
                oldend = j;
            }
            buf.append(input.substring(j,len));
            return buf.toString();
        }
    }
}
