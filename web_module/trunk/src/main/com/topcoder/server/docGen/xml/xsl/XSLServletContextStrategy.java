package com.topcoder.server.docGen.xml.xsl;

public class XSLServletContextStrategy implements XSLStrategy {

  javax.servlet.ServletContext ctx = null;

  XSLServletContextStrategy ( javax.servlet.ServletContext ctx ) {
    this.ctx = ctx;
  }

  //////////////////////////////////////////////////////////////
  public java.io.InputStream getStream ( String cacheKey ) {
  //////////////////////////////////////////////////////////////
    return ctx.getResourceAsStream ( cacheKey );
  }


}
