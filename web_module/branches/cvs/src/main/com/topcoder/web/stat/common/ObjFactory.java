package com.topcoder.web.stat.common;

import java.util.*;
import java.lang.reflect.*;
import com.topcoder.web.stat.common.*;

/**
 * This factory class dynamically creates class instances based on class name and parameter lists
 *
 * @version $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.1  2002/03/16 20:18:40  gpaul
 *           moving these over from the member dev area.
 *
 *           Revision 1.1  2002/02/08 04:13:59  tbone
 *           changed pkg
 *
 *           Revision 1.1  2002/02/06 08:58:52  tbone
 *           added class
 *
 * 
 */
public class ObjFactory {


  /**
   * This static factory method will forward the request to create(classname,ArrayList) with
   * an empty ArrayList.
   *
   * @param String  The class name to be instantiated
   * @return  Object The instance of the specified class
   * @throws DataRetrievalException
   */
  public static Object create(String sClassName)throws DataRetrievalException{
    return create(sClassName,new ArrayList(0));
  }

  /**
   * This factory method creates class instances based on class name and parameter lists
   *
   * @param String  The class name to be instantiated
   * @param ArrayList The arguments to be sent to the class constructor
   * @return  Object The instance of the specified class
   * @throws DataRetrievalException
   */
  public static Object create(String sClassName, ArrayList alParms) throws DataRetrievalException{
       Object retObj = null;
       try{
            Class c = Class.forName( sClassName );
            // Create the arguments contained in the constructor
            Class args[] = new Class[alParms.size()];
            ListIterator lit = alParms.listIterator();
            for(int i=0;lit.hasNext();i++){
              args[i] = lit.next().getClass();
            }
            // get the constructor from the class
            Constructor con = c.getConstructor( args );
            Object[] parameters = new Object[alParms.size()];
            lit = alParms.listIterator();
            for(int i=0;lit.hasNext();i++){
              parameters[i] = lit.next();
            }
            // Create new instance of the requested object
            Object obj = con.newInstance( parameters );
            return obj;

        }catch(ClassNotFoundException cnfe){
			cnfe.printStackTrace();
			throw new DataRetrievalException("ObjFactory error - class not found: " + sClassName);
        }catch(NoSuchMethodException nsme){
            nsme.printStackTrace();
            throw new DataRetrievalException("ObjFactory error - constructor was not found: " + sClassName);
        }catch(InvocationTargetException ite){
            ite.printStackTrace();
            throw new DataRetrievalException("ObjFactory error - constructor failed: " + sClassName);
        }catch(IllegalAccessException iae){
            iae.printStackTrace();
            throw new DataRetrievalException("ObjFactory error - permission: " + sClassName);
        }catch(InstantiationException ie){
            ie.printStackTrace();
            throw new DataRetrievalException("ObjFactory error - instantiation failed: " + sClassName);
        }
  }
}
