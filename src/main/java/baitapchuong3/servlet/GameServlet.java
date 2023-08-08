package baitapchuong3.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import baitapchuong3.model.Player;
import baitapchuong3.utilities.JspConstant;
import baitapchuong3.utilities.ServletConstant;
import baitapchuong3.utilities.UrlConstant;
@WebServlet(name = ServletConstant.GAME, urlPatterns = {UrlConstant.GAME, UrlConstant.HANDLEGAME})
public class GameServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			Optional<Cookie> username = Arrays.asList(cookies).stream().filter(t -> t.getName().equals("username")).findFirst();
				if (username.isPresent()) {
					req.setAttribute("username", username.get().getValue());
					req.getRequestDispatcher(JspConstant.GAME).forward(req, resp);
				}else {
					resp.sendRedirect(req.getContextPath());
				}
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		switch (path) {
		case UrlConstant.GAME: 
			String username = req.getParameter("input_name");
			Cookie cookie = new Cookie("username", username);
				cookie.setMaxAge(30*60);
				resp.addCookie(cookie);
			req.setAttribute("username", username);
			req.getRequestDispatcher(JspConstant.GAME).forward(req, resp);
			break;
		case UrlConstant.HANDLEGAME:
			Gson gson = new Gson();
			resp.setContentType("application/json");
	        resp.setCharacterEncoding("UTF-8");
	        PrintWriter out = resp.getWriter();
	        Player player = null;
	        try (BufferedReader reader = new BufferedReader(new InputStreamReader(req.getInputStream()))) {
	        	player = gson.fromJson(reader, Player.class);
	        }catch (Exception e) {
				// TODO: handle exception
			}
	        ServletConstant.playerList.add(player);
			String playerJson = gson.toJson(player);
			out.print(playerJson);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + path);
		}
		
	}
}
