import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.File;
import java.util.regex.*;
import java.util.Hashtable;
import javax.naming.InitialContext;
import javax.naming.Context;
import javax.naming.NamingException;

import com.topcoder.dde.catalog.*;

import javax.rmi.PortableRemoteObject;
public class CreateXSL
{

    public static void main(String[] args)
    {
        File templateFile = null;
        FileInputStream templateFileStream = null;
        try{
                long phase = 0L;
                String componentName = "";
                String componentId = "";
                String componentDesc = "";
                Context CONTEXT = getContext("org.jnp.interfaces.NamingContextFactory", "192.168.10.151:1099");
                System.out.println("tesT3");
                Object objTechTypes = CONTEXT.lookup("CatalogEJB");
                System.out.println("tesT3a");
                CatalogHome home = (CatalogHome) PortableRemoteObject.narrow(objTechTypes, CatalogHome.class);
                System.out.println("tesT3b");
                Catalog catalog = home.create();
                System.out.println("tesT4");
                Object objComponentMgr = CONTEXT.lookup("ComponentManagerEJB");
                ComponentManagerHome component_manager_home = (ComponentManagerHome) PortableRemoteObject.narrow(objComponentMgr, ComponentManagerHome.class);
                ComponentManager componentManager = null;
                System.out.println("tesT2");
                
                long lngComponent;

                java.util.Collection colComponents = catalog.getComponentsByStatus(ComponentInfo.APPROVED);
                ComponentSummary summaries[] = (ComponentSummary[])colComponents.toArray(new ComponentSummary[0]);
                for(int k = 0; k < summaries.length; k++)
                //for(int k = 0; k < 1; k++)
                {
                    Document requirementsDoc = null;
                    try {
    
                        lngComponent = summaries[k].getComponentId();
                        componentManager = component_manager_home.create(lngComponent);
                        java.util.Collection colTempDocuments = componentManager.getDocuments();

                        java.util.Iterator itr = colTempDocuments.iterator();
                        
                        while( itr.hasNext()) {
                            Document doc = (Document) itr.next();
                            //if(doc.getType() == Document.COMPONENT_SPECIFICATION && 
                            //    doc.getName().toLowerCase().startsWith("require"))
                            if(doc.getType() == 0)
                            {
                                requirementsDoc = doc;
                            }
                        }
                        
                        ComponentVersionInfo versionInfo = componentManager.getVersionInfo();
                        phase = versionInfo.getPhase();
                        ComponentInfo comp = componentManager.getComponentInfo();
                        
                        componentDesc = comp.getDescription();
                        componentName = comp.getName();
                        System.out.println(componentName);
                        componentId = Long.toString(comp.getId());
                    } catch (CatalogException e) {
                        System.out.println(e.getMessage());
        
                    } catch (Exception e) {
                        System.out.println("here:" + e.getMessage());
                    }           
    
    /** Getting file**/
                    String postfix = "development";
                    if(phase == ComponentVersionInfo.SPECIFICATION)
                    {
                        postfix = "design";
                    }
                    templateFile = new File("tcs_template-" + postfix + ".xsl");
                    templateFileStream = new FileInputStream(templateFile);
                    if(templateFile.length() > Integer.MAX_VALUE){
                        System.out.println("PROGRAM HAS PROBLEM!!!");
                    }
                    int bufferSize = (int)templateFile.length();
                    byte[] fileContents = new byte[bufferSize];
                    long n = templateFileStream.read(fileContents, 0, bufferSize); 
                    String output = "";
                    if (n != templateFile.length()) 
                        throw new Exception("Error in reading file '" + templateFile.getName() + "'"); 
    /** Got file**/
    
    
    
                    String fileName = replacePattern(componentName, " ", "_");
    
    
                    output = new String(fileContents);
                    output = replacePattern(output, "<<<overview>>>", componentDesc);
                    String formattedComponentName = replacePattern(componentName," ", "%20");
                    output = replacePattern(output, "<<<COMPONENT_NAME>>>", formattedComponentName);
                    output = replacePattern(output, "<<<COMPONENT_SPACE_NAME>>>", componentName);
                    output = replacePattern(output, "<<<COMPONENT_ID>>>", componentId);

                    if(requirementsDoc != null)
                    {
                        output = replacePattern(output, "<<<REQUIREMENTS_FILE>>>", "http://www.topcodersoftware.com/catalog/document?id=" + requirementsDoc.getId());
                    }
                       
                    //System.out.println( output ); 
    
    
                    
                    
                    
                    FileOutputStream fos = new FileOutputStream(fileName.toLowerCase() + "-" + postfix +".xsl");
                    byte[] outputBytes = output.getBytes();
                    for(int i = 0; i < outputBytes.length; i++)
                    {
                        fos.write(outputBytes[i]);
                    }
                    fos.close();
                }
        }
        catch(Exception e){
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        finally
        {
            try{
                templateFileStream.close();
            }
            catch(Exception e){
            }
        }
        //test();
      
    }

    private static String replacePattern(String sourceString, String patternMatch,
        String replaceString){
        String output = "";
        Pattern pattern = Pattern.compile(patternMatch);
        Matcher m = pattern.matcher(sourceString);
        return m.replaceAll(replaceString);

     }

    private static void test()
    {
        Context CONTEXT = null;
        System.out.println("tesT");
        try{
            
            CONTEXT = getContext("org.jnp.interfaces.NamingContextFactory", "172.16.20.222:1099");
            System.out.println("tesT3");
            Object objTechTypes = CONTEXT.lookup("CatalogEJB");
            System.out.println("tesT3a");
            CatalogHome home = (CatalogHome) PortableRemoteObject.narrow(objTechTypes, CatalogHome.class);
            System.out.println("tesT3b");
            Catalog catalog = home.create();
            System.out.println("tesT4");
            Object objComponentMgr = CONTEXT.lookup("ComponentManagerEJB");
            ComponentManagerHome component_manager_home = (ComponentManagerHome) PortableRemoteObject.narrow(objComponentMgr, ComponentManagerHome.class);
            ComponentManager componentManager = null;
            System.out.println("tesT2");
            long lngComponent;
            try {
                lngComponent = Long.parseLong("4202835");
                componentManager = component_manager_home.create(lngComponent);
                ComponentInfo comp = componentManager.getComponentInfo();
                
                System.out.println(comp.getDescription());
                System.out.println(comp.getName());
                System.out.println(comp.getId());
            } catch (CatalogException e) {
                System.out.println(e.getMessage());

            } catch (Exception e) {
                System.out.println("here:" + e.getMessage());
            }           
        }catch(Exception e)
        {System.out.println("here2:" + e.getMessage() + e.toString());}
    }

    public static Context getContext(String initialContextFactory, String providerUrl) throws NamingException {
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, initialContextFactory);
        env.put(Context.PROVIDER_URL, providerUrl);
        return new InitialContext(env);
    }

}