package com.topcoder.dde.persistencelayer.keys;

import java.io.Serializable;

/**
 * @version     1.0
 * @author      Mark Tong
 */

public final class CompForumXrefKey implements Serializable
{
   public Long compVersId;
   public Long categoryId;

   public CompForumXrefKey() {}

   public boolean equals(Object o) {
      if (!(o instanceof CompForumXrefKey)) {
          return false; 
      }
      CompForumXrefKey k = (CompForumXrefKey)o;
      return k.compVersId.equals(compVersId) && k.categoryId.equals(categoryId);
   }

   public int hashCode()
   {
      return 65521 * compVersId.hashCode() + categoryId.hashCode();
   }
}