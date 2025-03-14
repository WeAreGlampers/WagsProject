package com.example.demo.community;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.QnaDto;
import com.example.demo.utils.MyUtils;

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
}
