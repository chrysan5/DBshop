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

	// �α���
	public UsersDto login(Map<String, String> map) {
		return sqlSession.selectOne("com.shop.mybatis.login", map);
	}

	// ȸ������
	public int insertUser(Map<String, String> map) {
		return sqlSession.insert("com.shop.mybatis.insertUser", map);
	}

	// ���������� ��й�ȣ Ȯ��
	public int pwChk(Map<String, Object> map) {
		return sqlSession.selectOne("com.shop.mybatis.pwchk", map);
	}

	// ���������� ȸ������ �ҷ�����
	public UsersDto getMyInfo(String id) {
		return sqlSession.selectOne("com.shop.mybatis.getmyinfo", id);
	}

	// ȸ��Ż��
	public int deleteUsers(String id) {
		return sqlSession.update("com.shop.mybatis.deleteusers", id);
	}

	// ȸ������ ó��
	public int updateUsers(Map<String, String> map) {
		return sqlSession.update("com.shop.mybatis.updateusers", map);
	}

	// ȸ������ ���̵� �ߺ�üũ
	public int CheckDataJSon(String id) {
		return sqlSession.selectOne("com.shop.mybatis.checkDataJSon", id);
	}

}
