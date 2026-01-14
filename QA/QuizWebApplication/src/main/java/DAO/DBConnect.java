package DAO;
import java.sql.*;
public class DBConnect {
public Connection cn=null;
public DBConnect() throws Exception {
	Class.forName("org.postgresql.Driver");
	cn= DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgre","Password#12");
	}
public void QueryExecuter(String sql) throws Exception{
	Statement st =cn.createStatement();
	st.execute(sql);
	st.close();
	}
public ResultSet QueryReturn(String sql) throws Exception{
	Statement st=cn.createStatement();
	ResultSet rs=st.executeQuery(sql);
	return rs;
	}
public ResultSet QueryReturner(String string) {
	// TODO Auto-generated method stub
	return null;
}
}
