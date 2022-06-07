package com.company.shop.qnaAnswerdao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.shop.qnaAnswerbean.QnaAnswerDto;

@Repository
public class QnaAnswerDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int qnaAnswerInsert(QnaAnswerDto dto) {
		return sqlSession.insert("com.shop.mybatis.qnaAnswerInsert", dto);
	}
	
	 public void qnaAnswerDelete(int qnaNum) {
		 sqlSession.delete("com.shop.mybatis.qnaAnswerDelete", qnaNum);
	 }
	 
	 public boolean checkExistAns(int qnaNum) {
		 return sqlSession.selectOne("com.shop.mybatis.checkExistAns", qnaNum);
	 }
	 
	 public QnaAnswerDto qnaAnswerRead(int qnaNum) {
		 return sqlSession.selectOne("com.shop.mybatis.qnaAnswerRead", qnaNum);
     }
	 
}
