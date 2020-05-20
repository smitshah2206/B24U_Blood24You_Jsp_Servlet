package B24U;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.http.*;
public class LoginDonor extends HttpServlet 
{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        try 
        { 
            Connection con = DatabaseConnection.initializeDatabase();
            Statement st=con.createStatement();
            response.setContentType("text/html");
            String user_name=request.getParameter("user_name");
            String password=request.getParameter("password");
            ResultSet rs = st.executeQuery("SELECT * FROM donorlogin WHERE user_name='"+user_name+"' AND confirm_password='"+password+"' AND status=0");
            rs.last();
            int number=rs.getRow();
            int p_age=0;
            int yeardiff=0;
            int d_id=0;
            if (number==1)
            {
                HttpSession session=request.getSession();
                rs = st.executeQuery("SELECT * FROM donorlogin WHERE user_name='"+user_name+"' AND confirm_password='"+password+"' AND status=0");
                while(rs.next())
                {
                    d_id=rs.getInt("id");
                    p_age=rs.getInt("age");
                    session.setAttribute("id",rs.getInt("id"));
                    session.setAttribute("old_user_name",rs.getString("user_name"));
                    session.setAttribute("user_name",rs.getString("user_name"));
                    session.setAttribute("user_full_name",rs.getString("user_full_name"));
                    session.setAttribute("old_user_email",rs.getString("user_email"));
                    session.setAttribute("user_email",rs.getString("user_email"));
                    session.setAttribute("old_user_number",rs.getString("user_number"));
                    session.setAttribute("user_number",rs.getString("user_number"));
                    session.setAttribute("password",rs.getString("confirm_password"));
                    session.setAttribute("confirm_password",rs.getString("confirm_password"));
                    session.setAttribute("Address",rs.getString("Address"));
                    session.setAttribute("pincode",rs.getString("pincode"));
                    session.setAttribute("gender",rs.getString("gender"));
                    session.setAttribute("blood_group",rs.getString("blood_group"));
                    session.setAttribute("city",rs.getString("city"));
                    session.setAttribute("weight",rs.getString("weight"));
                    session.setAttribute("blood_pressure",rs.getString("blood_pressure"));
                    session.setAttribute("pulse",rs.getString("pulse"));
                    session.setAttribute("hemoglobin",rs.getString("hemoglobin"));
                    session.setAttribute("last_donation",rs.getString("last_donation"));                
                    session.setAttribute("health_report",rs.getString("health_report"));
                    session.setAttribute("last_place_donation",rs.getString("last_place_donation"));
                    session.setAttribute("total_donation",rs.getString("total_donation"));
                    session.setAttribute("attend_event",rs.getString("attend_event"));
                    session.setAttribute("blood_donation",rs.getString("blood_donation"));
                    session.setAttribute("pletlets_donation",rs.getString("pletlets_donation"));
                    session.setAttribute("plasama_donation",rs.getString("plasama_donation"));
                    session.setAttribute("date_of_birth_a",rs.getString("date_of_birth"));
                    String date1=rs.getString("date_of_birth");
                    SimpleDateFormat ft1=new SimpleDateFormat("yyyy-MM-dd");
                    Date d11=ft1.parse(date1);
                    SimpleDateFormat ftd1=new SimpleDateFormat("dd-MM-yyyy");
                    session.setAttribute("date_of_birth",ftd1.format(d11));

                    String Date_Of_Birth=rs.getString("date_of_birth");
                    Date date=new Date();
                    SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
                    String date2=ft.format(date);
                    Date d1=ft.parse(Date_Of_Birth);
                    Date d2=ft.parse(date2);
                    long diff=d2.getTime() - d1.getTime();
                    yeardiff=(int)(diff/(1000*60*60*24))/365;
                    session.setAttribute("age",yeardiff);
                }
                if(yeardiff >p_age)
                {
                    st.executeUpdate("UPDATE donorlogin SET age='"+yeardiff+"' WHERE id='"+d_id+"'");
                }
                out.print("<html><body><script>alert('Welcome ...!!!!');window.location='/B24U/Donor/donor_page.jsp';</script><body></html>");        
            }
            else
            {
                out.print("<html><body><script>alert('Username/password Combination does not match.');window.location='/B24U/login_donor.jsp';</script><body></html>");
                rs.close(); 
                con.close();
            }
        } 
        catch (Exception e) 
        { 
            out.print("<html><body><script>alert('Something went wrong....!!!');window.location='/B24U/login_donor.jsp';</script><body></html>");
        } 
    }
}
