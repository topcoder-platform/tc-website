/*
    RenderIfc
    An interface defining the behavior that the TopCoder website rendering
    system must provide to its JSPs.

    By John C. Bollinger
    Copyright 2002, TopCoder, Inc.
 */

package com.topcoder.web.render.bean;

public interface RenderIfc {

    /*
       getContent returns, as a String, the content field of the web_content
       entity with the specified content_name.
     */
    public String getContent(String name) throws Exception;

    /*
       getFileURL returns, as a String, the link field of the sector_file
       entity with the specified sector_id.
     */
    public String getFileURL(int sectorId) throws Exception;

}

