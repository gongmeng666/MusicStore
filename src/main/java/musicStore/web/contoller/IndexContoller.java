package musicStore.web.contoller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import musicStore.biz.AlbumBiz;
import musicStore.biz.GenreBiz;

@Controller
public class IndexContoller {
	@Autowired
	private GenreBiz genrebiz;
	
	@Autowired
	private AlbumBiz albumbiz;
	
	@RequestMapping("/index")
	private String list(Map<String ,Object> model) {
		model.put("genres",genrebiz.findAll());
		model.put("albums", albumbiz.findAll());
		return "index";
	}
}
