package com.topcoder.shared.docGen.xml.xsl;

import com.topcoder.shared.util.logging.Logger;

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
  private static Logger log = Logger.getLogger(XSLTransformerCache.class);


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
   * This method artificially requires that the cacheKey be the path/filename of the xsl template
   * this is not strictly necessary, but we would need another method taking both a key and 
   * a template stream.
   *     
   * @param cacheKey the unique identifier for the XSLTransformerWrapper possibly in the cache.
   *     
   * @return a XSLTransformerWrapper identified by the cacheKey.
   *     
   * @throws Exception
   */
  public XSLTransformerWrapper getXSLTransformerWrapper ( String cacheKey )
    throws Exception {
    log.debug("XSLTransformerCache.getXSLTransformerWrapper for " + cacheKey);
    XSLTransformerWrapper result = null;
    try {
      if ( cacheKey == null ) throw new Exception ( "The cacheKey can not be null." );
      if ( cache.containsKey(cacheKey) )
      {
        result = ( XSLTransformerWrapper ) cache.get ( cacheKey );
      }
      else
      {
        java.io.File file = new java.io.File(cacheKey);
        if ( !file.exists()) throw new Exception ( "Unable to find file " + cacheKey + "." );
        result = new XSLTransformerWrapper(file);
        cache.put ( cacheKey, result);
      }
    } catch ( Exception e ) {
      throw  e;
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
