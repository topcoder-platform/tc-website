package com.topcoder.dde.persistencelayer.keys;

import java.io.Serializable;

/**
 * @version     1.0
 * @author      Mark Tong
 */

public final class CompForumXrefKey implements Serializable
{
   public long categoryId;
   public long compVersId;

   public CompForumXrefKey() {}

   public boolean equals(Object o) {
      if (!(o instanceof CompForumXrefKey)) {
          return false; 
      }
      CompForumXrefKey k = (CompForumXrefKey)o;
      return k.compVersId == compVersId && k.categoryId == categoryId;
   }

   public int hashCode()
   {
      return (int)(65521 * compVersId + categoryId);
   }
}