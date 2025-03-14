package com.example.demo.community;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.NoticeDto;

@Service
@Qualifier("cs")
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityMapper mapper;

	@Override
	public String noticeList(Model model) {
		ArrayList<NoticeDto> nlist=mapper.noticeList();
		model.addAttribute("nlist",nlist);
		return "/community/noticeList";
	}

	@Override
	public String noticeContent(String id, Model model) {
		NoticeDto ndto=mapper.noticeContent(id);
		ndto.setContent(ndto.getContent().replace("\r\n", "<br>"));
		model.addAttribute("ndto",ndto);
		return "/community/noticeContent";
	}
}
