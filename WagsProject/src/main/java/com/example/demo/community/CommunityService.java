package com.example.demo.community;

import org.springframework.ui.Model;

public interface CommunityService {
	public String noticeList(Model model);
	public String noticeContent(String id,Model model);
}
