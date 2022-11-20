
package pe.edu.pucp.lp2soft.config;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
    private static DBManager dbManager;
    private String url = "jdbc:mysql://lasjoyasdb.cmkeurxfbwvg.us-east-1.rds.amazonaws.com:3306/DBProyectoLP2?useSSL=false";
    private String user = "adminjoya";
    private String password = "lasjoyaslp2";
    private Connection con;
    
    private synchronized static void createInstance(){
        if(dbManager == null){
            dbManager = new DBManager();
        }
    }
    
    public Connection getConnection(){
        try{
            //Registrar el Driver (ensamblado) de conexión
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,user,password);
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return con;
    }
    
    public static DBManager getInstance(){
        if(dbManager == null){
            createInstance();
        }
        return dbManager;
    }
}
