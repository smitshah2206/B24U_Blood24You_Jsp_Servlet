package B24U;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class DatabaseConnection extends HttpServlet
{
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException 
    {
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/b24u","root","");
        return con;
    }
}
