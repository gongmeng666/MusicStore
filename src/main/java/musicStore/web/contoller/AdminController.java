package musicStore.web.contoller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import musicStore.biz.AlbumBiz;
import musicStore.biz.GenreBiz;
import musicStore.entity.Album;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private AlbumBiz albumbiz;

	@Autowired
	private GenreBiz genrebiz;

	@RequestMapping("index")
	private String index() {
		return "admin/admin-index";
	}

	@RequestMapping("/albumManagement")
	public String albumManagement(Model model,
			@RequestParam(name = "cid", required = false, defaultValue = "0") int cid, String title,
			@RequestParam(name = "page", required = false, defaultValue = "1") int page) {
		final int pageSize = 4;
		model.addAttribute("genres", genrebiz.findAll());
		List<Album> albumes = albumbiz.findAlbumsPagings(cid, title, (page - 1) * pageSize, pageSize);
		model.addAttribute("albumes", albumes);
		int rows = albumbiz.fetchAlbumRows(cid, title);
		int totalPages = rows % pageSize == 0 ? rows / pageSize : rows / pageSize + 1;
		model.addAttribute("page", page);
		model.addAttribute("totalPages", totalPages);
		return "admin/admin-album-list";
	}

	@RequestMapping(value="/albumadd",method=RequestMethod.GET)
	public String albumadd(Model model) {
		model.addAttribute("genres",genrebiz.findAll());
		return "admin/albumadd";
	}
	

	@RequestMapping(value = "/albumadd", method = RequestMethod.POST)
	public String save(Album album, Model model,
			@RequestParam(name = "CoverImages", required = false) MultipartFile CoverImages, HttpServletRequest req)
			throws IllegalStateException, IOException {
		System.out.println(album.getGenreId());

		if (!CoverImages.isEmpty()) {
			String vpath = "/static/CoverImages";
			String path = req.getServletContext().getRealPath(vpath);
			String filename = path + "/" + album.getId() + ".jpg";
			CoverImages.transferTo(new File(filename));
			if (album.getId() > 0) {
				albumbiz.update(album);
			} else {
				albumbiz.add(album);
			}
		}
		return "redirect:/admin/albumManagement";

	}

	@RequestMapping("/albumEdit")
	public String edit(Model model,Integer id) {
		id=id==null?0:id;
		model.addAttribute("genres",genrebiz.findAll());
		if(id>0) {
			model.addAttribute("album",albumbiz.fetchById(id));
		}
		return "admin/albumEdit";
	}
}
