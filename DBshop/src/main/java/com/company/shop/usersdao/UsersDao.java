package com.company.shop.usersdao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.shop.usersbean.UsersDto;

@Repository
public class UsersDao {

	@Autowired
	private SqlSession sqlSession;

	// 로그인
	public UsersDto login(Map<String, String> map) {
		return sqlSession.selectOne("com.shop.mybatis.login", map);
	}

	// 회원가입
	public int insertUser(Map<String, String> map) {
		return sqlSession.insert("com.shop.mybatis.insertUser", map);
	}

	// 마이페이지 비밀번호 확인
	public int pwChk(Map<String, Object> map) {
		return sqlSession.selectOne("com.shop.mybatis.pwchk", map);
	}

	// 마이페이지 회원정보 불러오기
	public UsersDto getMyInfo(String id) {
		return sqlSession.selectOne("com.shop.mybatis.getmyinfo", id);
	}

	// 회원탈퇴
	public int deleteUsers(String id) {
		return sqlSession.update("com.shop.mybatis.deleteusers", id);
	}

	// 회원정보 처리
	public int updateUsers(Map<String, String> map) {
		return sqlSession.update("com.shop.mybatis.updateusers", map);
	}

	// 회원가입 아이디 중복체크
	public int CheckDataJSon(String id) {
		return sqlSession.selectOne("com.shop.mybatis.checkDataJSon", id);
	}

}
