package baitapchuong3.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import baitapchuong3.model.Player;
import baitapchuong3.utilities.JspConstant;
import baitapchuong3.utilities.ServletConstant;
import baitapchuong3.utilities.UrlConstant;
@WebServlet(name = ServletConstant.RECORD, urlPatterns = {UrlConstant.RECORD, UrlConstant.LOGOUT})
public class RecordServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		switch (path) {
		case UrlConstant.RECORD: 
				List<Player> playerList = ServletConstant.playerList.stream().sorted(Comparator.comparingInt(Player::getCount)).collect(Collectors.toList());
				req.setAttribute("PlayerList", playerList);
				req.getRequestDispatcher(JspConstant.RECORD).forward(req, resp);
			break;
		case UrlConstant.LOGOUT:
				Cookie cookie[] = req.getCookies();
				Optional<Cookie> username = Arrays.asList(cookie).stream().filter(t -> t.getName().equals("username")).findFirst();
				username.get().setMaxAge(0);
				resp.sendRedirect(req.getContextPath());
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + path);
		}
	}
}
