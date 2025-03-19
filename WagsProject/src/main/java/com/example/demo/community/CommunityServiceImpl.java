
package com.example.demo.community;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.FreeBoardDto;
import com.example.demo.dto.NoticeDto;
import com.example.demo.dto.QnaDto;
import com.example.demo.utils.MyUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("cs")
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityMapper mapper;

	@Override
	public String comQnaList(HttpSession session, Model model, QnaDto qdto) {
	
		ArrayList<HashMap> qnaMap = mapper.getQna();
		model.addAttribute("qnaMap",qnaMap);
		for (int i = 0; i < qnaMap.size(); i++) {
			HashMap map = qnaMap.get(i);
			int type=99;
			if(map.get("type")!=null) {
				type= (int)map.get("type");
			}
			
			String typeStr = MyUtils.typeStr(type);
			map.put("type", typeStr);
			
			if (map.get("userid").equals("admin")) {
				map.put("userid", "관리자");
			}
			
			String writeday = map.get("writeday").toString();
			String writedayTime = writeday.substring(0, 16);
			map.put("writedayTime",writedayTime);
			
			String pcode = mapper.getPtitle(map.get("pcode").toString());
			map.put("pcode", pcode);
		}
		return "/community/comQnaList";
	}

	@Override
	public String write(HttpSession session, Model model) {
		String userid = session.getAttribute("userid").toString();

		model.addAttribute("userid");

		return "community/write";
	}

	@Override
	public String writeOk(FreeBoardDto bdto) {

		mapper.writeOk(bdto);

		return "redirect:/community/freeBoard";
	}

	@Override
	public String freeBoard(Model model, HttpServletRequest request) {
		// 페이지 처리
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int index = (page - 1) * 10;

		int pstart, pend, totalPages;
		pstart = page / 10;
		if (page % 10 == 0)
			pstart = pstart - 1;

		pstart = (pstart * 10) - 1;
		pend = pstart + 9;

		totalPages = mapper.getTotal();

		if (pend > totalPages)
			pend = totalPages;

		ArrayList<FreeBoardDto> blist = mapper.getList(index);

		// blist 보내기
		model.addAttribute("blist", blist);

		// page 관련 보내기
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("totalPages", totalPages);

		return "community/freeBoard";
	}

	@Override
	public String views(HttpServletRequest request) {
		String id = request.getParameter("id");
		String page = request.getParameter("page");

		mapper.views(id);

		return "redirect:/community/content";
	}

	@Override
	public String content(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
		String page=request.getParameter("page");
		
		FreeBoardDto bdto = mapper.content(id); // 조건에 맞는 내용만 가져오기
		
		model.addAttribute("bdto",bdto);
		model.addAttribute("page",page);
		
		return "community/content";
	}

	@Override
	public String noticeList(Model model, HttpServletRequest request) {
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int index = (page - 1) * 10;

		int pstart, pend, totalPages;
		pstart = page / 10 ;
		if (page % 10 == 0)
			pstart = pstart - 1;

		pstart = (pstart * 10) + 1;
		pend = pstart + 9;

		totalPages = mapper.getNoticeTotal();

		if (pend > totalPages)
			pend = totalPages;

		ArrayList<NoticeDto> nlist=mapper.noticeList(index);
		model.addAttribute("nlist",nlist);
		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("index",index);
		return "/community/noticeList";
	}

	@Override
	public String noticeContent(HttpServletRequest request, Model model) {
		NoticeDto ndto=mapper.noticeContent(request.getParameter("id"));
		ndto.setContent(ndto.getContent().replace("\r\n", "<br>"));
		model.addAttribute("ndto",ndto);
		model.addAttribute("page",request.getParameter("page"));
		return "/community/noticeContent";
	}
}


