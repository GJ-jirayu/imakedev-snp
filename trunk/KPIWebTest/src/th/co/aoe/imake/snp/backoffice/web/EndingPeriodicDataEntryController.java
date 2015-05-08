package th.co.aoe.imake.snp.backoffice.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
@Controller
//@RequestMapping(value={"/ending_periodic_data_entry"})
public class EndingPeriodicDataEntryController {
	 /*@RequestMapping(value={"/load"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
	*/
	//@RequestMapping(method = RequestMethod.GET)
	// @RequestMapping("/welcome.do")
	 public String init(HttpServletRequest request,Model model)
	    {
		 System.out.println(request.getParameter("page"));
		  model.addAttribute("display", "display: none");
	        return "ending_periodic_data_entry/template/"+request.getParameter("page");
	    }
}
