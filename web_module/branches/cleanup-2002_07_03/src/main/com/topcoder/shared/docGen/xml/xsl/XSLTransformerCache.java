package com.topcoder.shared.docGen.xml.xsl;


/**
 * XSLTransformerCache.java
 *
 * Description: A Singleton Cache for XSLTransformerWrappers
 *
 * @author      Steve Burrows (chuck)
 * @version     1.0
 *
 */

public class XSLTransformerCache {

  private static java.util.HashMap cache = null;
  private static XSLTransformerCache xslTransformerCache = null;


  /* Singleton -- the constructor is private, must use getInstance. */
  private XSLTransformerCache () {
    cache = new java.util.HashMap ( 50 );
  }


  /**
   * Singleton method for getting the one instance of this class (per VM)
   */
  public static XSLTransformerCache getInstance() {
    if ( xslTransformerCache == null ) xslTransformerCache = new XSLTransformerCache ();
    return xslTransformerCache;
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
  public XSLTransformerWrapper getXSLTransformerWrapper ( String cacheKey )
    throws XSLTransformerWrapperException {
    XSLTransformerWrapper result = null;
    try {
      if ( cacheKey == null ) throw new XSLTransformerWrapperException ( "The cacheKey can not be null." );
      if ( cache.containsKey(cacheKey) )
      {
        result = ( XSLTransformerWrapper ) cache.get ( cacheKey );
      }
      else
      {
        java.net.URL url = new java.net.URL ( cacheKey );
        java.io.InputStream iStream = url.openStream();
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
  public boolean isEmpty() {
    return cache.isEmpty();
  }

  /**
   * Remove the XSLTransformerWrapper instance from the cache indicated by the cacheKey.
   *
   * @param cacheKey the unique identifier for the XSLTransformerWrapper in the cache.
   */
  public synchronized void remove ( String cacheKey ) {
    cache.remove ( cacheKey );
  }

  /**
   * Remove all XSLTransformerWrapper instances from the cache.
   */
  public synchronized void clear() {
    cache.clear();
  }

  /**
   * The number of XSLTransformerWrapper instances in the cache.
   *
   * @return the integer number of entries in the XSLTransformerWrapper cache.
   *
   */
  public int size() {
    return cache.size();
  }


}
