package com.example.demo.member;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {
	

}
