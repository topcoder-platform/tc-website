package com.topcoder.server.docGen.xml.xsl;


/**
 * XSLTransformerCache.java
 *
 * Description: A Singleton Cache for XSLTransformerWrappers
 * Changable strategy for converting name of xsl stylesheet cacheKey 
 * into InputStream.
 *
 * @author      Steve Burrows (chuck)
 * @version     1.0
 *
 */

public class XSLTransformerCache {

  private static java.util.HashMap cache = null;
  private static XSLStrategy strategy = null;
  private static XSLTransformerCache xslTransformerCache = null;


  // Singleton -- the constructor is private, must use getInstance.
  private XSLTransformerCache () {
    cache = new java.util.HashMap ( 50 );
  }


  /**
   * Singleton method for getting the one instance of this class (per VM)
   */

  //////////////////////////////////////////////////////////////
  public XSLTransformerCache getInstance () {
  //////////////////////////////////////////////////////////////
    if ( xslTransformerCache == null ) xslTransformerCache = new XSLTransformerCache ();
    return xslTransformerCache;
  }

  /**
   * Set the strategy implementation to convert the cacheKey into an InputStream of the XSL stylesheet.
   *
   * @param strategy        the XSLStrategy implementation to convert the cacheKey into an InputStream of the XSL stylesheet.
   */
  
  //////////////////////////////////////////////////////////////
  public void setStrategy ( XSLStrategy strategy ) {
  //////////////////////////////////////////////////////////////
    this.strategy = strategy;
  }

  /**
   * Get the XSLTransformerWrapper indicated by the cacheKey.
   * If the XSLTransformerWrapper does not exist in the cache, it is created and put in the cache.
   *     
   * @param cacheKey the unique identifier for the XSLTransformerWrapper possibly in the cache.
   *     
   * @return a XSLTransformerWrapper identified by the cacheKey.
   *     
   * @throws XSLTransformerWrapperException
   */

  ////////////////////////////////////////////////////////
  public XSLTransformerWrapper getXSLTransformerWrapper ( String cacheKey )
    throws XSLTransformerWrapperException {
  ////////////////////////////////////////////////////////
    XSLTransformerWrapper result = null;
    try {
      if ( cacheKey == null ) throw new XSLTransformerWrapperException ( "The cacheKey can not be null." );
      if ( cache.containsKey(cacheKey) )
      {
        result = ( XSLTransformerWrapper ) cache.get ( cacheKey );
      }
      else
      {
        java.io.InputStream iStream = strategy.getStream ( cacheKey );    
        if ( iStream == null ) throw new XSLTransformerWrapperException ( "Unable to getStream from XSLStrategy." );
        cache.put ( cacheKey, new XSLTransformerWrapper(iStream) );
      }
    } catch ( Exception e ) {
      throw new XSLTransformerWrapperException ( e.getMessage() );
    }
    return result;
  }


  /**
   * returns boolean true of the cache is empty.
   *
   * @return true of the cache is empty.
   */

  ////////////////////////////////////////////////////////////////////////////////
  public boolean isEmpty() {
  ////////////////////////////////////////////////////////////////////////////////
    return cache.isEmpty();
  }

  /**
   * Remove the XSLTransformerWrapper instance from the cache indicated by the cacheKey.
   *
   * @param cacheKey the unique identifier for the XSLTransformerWrapper in the cache.
   */

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void remove ( String cacheKey ) {
  ////////////////////////////////////////////////////////////////////////////////
    cache.remove ( cacheKey );
  }

  /**
   * Remove all XSLTransformerWrapper instances from the cache.
   */

  ////////////////////////////////////////////////////////////////////////////////
  public synchronized void clear() {
  ////////////////////////////////////////////////////////////////////////////////
    cache.clear();
  }

  /**
   * The number of XSLTransformerWrapper instances in the cache.
   *
   * @return the integer number of entries in the XSLTransformerWrapper cache.
   *
   */

  ////////////////////////////////////////////////////////////////////////////////
  public int size() {
  ////////////////////////////////////////////////////////////////////////////////
    return cache.size();
  }


}
