import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by compsci on 1/31/15.
 */
public class DepositServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setAttribute("page", "null");
        req.setAttribute("isApproved", "1");
        req.setAttribute("log", LoginStatus.getLogOutUrl("/"));
        try {
            req.getRequestDispatcher("Deposit.jsp").forward(req, resp);
        } catch (Exception e) {e.printStackTrace();}
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp){
    }
}
