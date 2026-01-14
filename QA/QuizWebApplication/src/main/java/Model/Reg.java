 package Model;

 import java.sql.ResultSet;

 import DAO.DBConnect;

 public class Reg {
   private String email;
   private String password;
   private String name;
   private String mobile;

   public Reg() {
   }

   public Reg(String e, String p, String n, String m) {
     this.email = e;
     this.password = p;
     this.name = n;
     this.mobile = m;
   }

   public String getEmail() {
     return email;
   }

   public void setEmail(String email) {
     this.email = email;
   }

   public String getPassword() {
     return password;
   }

   public void setPassword(String password) {
     this.password = password;
   }

   public String getName() {
     return name;
   }

   public void setName(String name) {
     this.name = name;
   }

   public String getMobile() {
     return mobile;
   }

   public void setMobile(String mobile) {
     this.mobile = mobile;
   }

   public void InsertReg() throws Exception {
     DBConnect x = new DBConnect();
     x.QueryExecuter("insert into userreg values('" + this.email + "','" + this.password + "','" + this.mobile
         + "','" + this.name + "')");
   }

   public boolean checkUser(String e, String p) throws Exception {
     DBConnect x = new DBConnect();
     ResultSet rs = x.QueryReturner("select * from userreg where email='"
     + e + "' and password='" + p + "'");
     if (rs.next()) {
       this.setMobile(rs.getString(3));
       this.setName(rs.getString(4));
       return true;
     }
     return false;
   }
 }
 