package com.company.shop.qnadao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.shop.qnabean.QnaDto;

@Repository
public class QnaDao {

	@Autowired
	private SqlSession sqlSession;

	public int qnaInsert(QnaDto dto) {
		return sqlSession.insert("com.shop.mybatis.insertQna", dto);
	}

	public int qnaCount() {
		return sqlSession.insert("com.shop.mybatis.qnaCount");
	}

	public List<QnaDto> selectAllQnaPaging(Map<String, Integer> map) {
		return sqlSession.selectList("com.shop.mybatis.selectAllQnaPaging", map);
	}

	public List<QnaDto> qnaList() {
		return sqlSession.selectList("com.shop.mybatis.selectAllQna");
	}

	public QnaDto qnaRead(int qnaNum) {
		return sqlSession.selectOne("com.shop.mybatis.selectOneQna", qnaNum);
	}

	public QnaDto qnaPrevRead(int qnaNum) {
		return sqlSession.selectOne("com.shop.mybatis.selectOnePrevQna", qnaNum);
	}

	public QnaDto qnaNextRead(int qnaNum) {
		return sqlSession.selectOne("com.shop.mybatis.selectOneNextQna", qnaNum);
	}

	public void qnaDelete(int qnaNum) {
		sqlSession.delete("com.shop.mybatis.qnaDelete", qnaNum);
	}

	public int qnaUpdate(Map<String, Object> map) {
		return sqlSession.update("com.shop.mybatis.qnaUpdate", map);
	}

}