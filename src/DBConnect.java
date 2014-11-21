import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by xiaomin on 2014/11/13.
 */
public class DBConnect {
    //数据库连接封装
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String driverClass = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/news?characterEncoding=utf8";

    // 完成连接的创建
    public Connection getConnection() throws Exception {
        Class.forName(driverClass);//加载驱动程序
        if (con == null) {
            con = DriverManager.getConnection(url, "root", "");
        }
        return con;
    }

    //创建语句对象
    public PreparedStatement createStatement(String sql) throws Exception {
        stmt = getConnection().prepareStatement(sql);
        return stmt;
    }

    //执行带有结果集返回的方法
    public ResultSet executeQuery() throws Exception {
        rs = stmt.executeQuery();
        return rs;
    }

    //执行没有结果集返回的方法
    public int executeUpdate() throws Exception {
        return stmt.executeUpdate();
    }

    //关闭对象
    public void close() {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }
}
