 package musicStore.web.contoller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Converter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import musicStore.biz.AlbumBiz;
import musicStore.biz.GenreBiz;
import musicStore.biz.UserBiz;
import musicStore.entity.Album;
import musicStore.entity.Genre;
import musicStore.entity.User;

@Controller

public class AccountController {
	@Autowired
	private UserBiz userbiz;

	@Autowired
	private AlbumBiz albumbiz;

	@Autowired
	private GenreBiz genrebiz;

	@RequestMapping("/register")
	public String register(User user) {
		if (user.getUsername() != null) {
			userbiz.add(user);
			return "redirect:login";
		} else {
			return "register";
		}

	}

	@RequestMapping("/login")
	public String login(Map<String, Object> model, String username, String password, HttpSession session) {
		User loginUser = userbiz.checkLogin(username, password);
		if (loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/index";
		} else {
			model.put("message", "用户名或者密码有误");
			return "login";
		}

	}
	
	@RequestMapping("/checkUsernameNotDuplicated")
	public void checkusername(String username,HttpServletResponse response) throws IOException {
		User user=userbiz.fetchByUsername(username);
		response.getWriter().print(user==null);
	}

	@RequestMapping("/albumEdit")
	public String albumEdit(Model model, Integer id) {
		id = id == null ? 0 : id;
		model.addAttribute("genres", genrebiz.findAll());
		if (id > 0) {
			model.addAttribute("album", albumbiz.fetchById(id));
		}
		return "albumEdit";
	}

	@RequestMapping("albumList")
	public String findAlbums(Model model, Integer cid, String title, Integer pageNum) {
		int pageSize = 4;
		if (pageNum == null) {
			pageNum = 1;
		}
		if (cid == null) {
			cid = 0;
		}
		int rows = albumbiz.fetchAlbumRows(cid, title);
		model.addAttribute("albums", albumbiz.findAlbumsPagings(cid, title, pageNum, pageSize));
		model.addAttribute("pages", rows % pageSize == 0 ? rows / pageSize : rows / pageSize + 1);
		model.addAttribute("page", pageNum);
		model.addAttribute("cid", cid);
		model.addAttribute("title", title);
		return "album-list";
	}

	@RequestMapping("album")
	public String getAlbums(int albumId, Model model) {
		model.addAttribute("album", albumbiz.fetchById(albumId));
		return "album-detail";
	}

}
