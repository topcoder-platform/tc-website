package com.topcoder.common.web.util;

import java.io.*;
import javax.naming.*;
import com.topcoder.common.web.error.*;
import com.topcoder.ejb.Util.*;
import weblogic.io.common.*;
import weblogic.common.*;
import com.topcoder.common.web.error.*;
import com.topcoder.common.web.xml.*;
import com.topcoder.common.TCContext;


public final class FileIO {


  ///////////////////////////////////////////////////////////////////////////////////
  public static final void writeObject(Object obj, String fileName) {
  ///////////////////////////////////////////////////////////////////////////////////

    try {
      FileOutputStream fout = new FileOutputStream(fileName);
      ObjectOutputStream oos = new ObjectOutputStream(fout);
      oos.writeObject(obj);
      oos.close();
    }catch (Exception e) {
      e.printStackTrace();
    }
  }


  ///////////////////////////////////////////////////////////////
  public static byte[] getFileBytes ( String fileSystem, String fileName )
    throws TCException {
  ///////////////////////////////////////////////////////////////
    byte[] result = null;
    Context ctx = null;
    InputStream input = null;
    try {
      ctx = TCContext.getInitial();
      T3ServicesDef t3 = ( T3ServicesDef ) ctx.lookup ( "weblogic.common.T3Services" );
      T3FileSystem myfs = t3.io().getFileSystem ( fileSystem );
      T3File myFile = myfs.getFile ( fileName );
      input = myFile.getFileInputStream();
      result = new byte [ (int) myFile.length() ];
      input.read ( result );
    } catch ( Exception e ) {
      e.printStackTrace();
      StringBuffer msg = new StringBuffer(1000);
      msg.append("common.web.util.FileIO:getFileBytes:ERROR:\n");
      try {
        WebPage error = new WebPage ( "Parameters"   );
        error.addTag ( new ValueTag("FileSystem",fileSystem)     );
        error.addTag ( new ValueTag("FileName",fileName)         );
        msg.append ( error.getXML(2) );
      } catch ( Exception ignore ) {}
      msg.append ( e.getMessage() );
      throw new TCException ( msg.toString() );
    } finally {
      if (ctx != null)   { try { ctx.close(); } catch (Exception ignore) {} }
      if (input != null) { try { input.close(); } catch ( Exception ignore ) {} }
    }
    return result;
  }

 
}
