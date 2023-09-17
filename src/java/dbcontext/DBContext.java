package dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    String instance = "";
    String serverName = "localhost";
    String portNumber = "1433";
    String dbName = "CarManagement";
    String userID = "sa";
    String password = "12345";
    public Connection getConnection() throws ClassNotFoundException, SQLException{
        
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        if (instance == null || instance.trim().isEmpty()){
         url = "jdbc:sqlserver://" + serverName + ":" + portNumber +";databaseName=" + dbName;
         }
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
      // Class.forName(): Load class Driver tại thời điểm chạy.
      //"com.microsoft.sqlserver.jdbc.SQLServerDriver" là địa chỉ của Driver.
      return DriverManager.getConnection(url, userID, password);
      
    }
}
